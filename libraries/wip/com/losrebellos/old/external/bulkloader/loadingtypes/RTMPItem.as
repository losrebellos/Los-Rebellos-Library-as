package com.losrebellos.old.external.bulkloader.loadingtypes 
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	import com.losrebellos.constants.states.NetStatusState;
	import com.losrebellos.events.NetStreamClientEvent;
	import com.losrebellos.net.NetStreamClient;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.URLRequest;











	/** @private */
	public class RTMPItem extends LoadingItem 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		private var _netConnection:NetConnection;
		public var stream:NetStream;
		private var _client:NetStreamClient;
		private var _metaData:Object;
		private var _metaDataSet:Object;
		public var pausedAtStart:Boolean = false;

		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function RTMPItem(url:URLRequest, type:String, uid:String)
		{
			specificAvailableProps = [BulkLoader.PAUSED_AT_START, "metaData", "connection"];
			
			super(url, type, uid);
			
			// apparently, if the stream is a mp4 file, this value beings as -1! issue 57
			_bytesTotal = _bytesLoaded = 0;
		}
		override public function _parseOptions(props:Object):Array
		{
			pausedAtStart = props[BulkLoader.PAUSED_AT_START] || false;
			_netConnection = props["connection"];
			_metaDataSet = props["metaData"];

			return super._parseOptions(props);
		}

		
		/*
		 * 
		 * LOADING
		 * 
		 */
		override public function load():void
		{
			super.load();
			
			_client = new NetStreamClient();
			_client.addEventListener(NetStreamClientEvent.META_DATA, onMetadata);
			
			stream = new NetStream(_netConnection);
			stream.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler, false, 0, true);
			stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityErrorHandler, false, 0, true);
			stream.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus, false, 0, true);
			stream.client = _client;
			stream.play(url.url, 0, -1);
//			stream.seek(0);
		}
		
		
		/*
		 * 
		 * HANDLERS
		 * 
		 */
		private var _ready:Boolean = false;
		private function ready():void
		{
			// stream can be played
			dispatchEvent(new Event(BulkLoader.CAN_BEGIN_PLAYING));
			
			// all loaded
			super.onProgressHandler(new ProgressEvent(ProgressEvent.PROGRESS, false, false, 1, 1));
			
			// complete
			onCompleteHandler(new Event(Event.COMPLETE));
		}
		override public function onCompleteHandler(evt:Event):void 
		{
			_content = stream;
			
			super.onCompleteHandler(evt);
		}
		override public function onStartedHandler(evt:Event):void
		{
			_content = stream;
			if(pausedAtStart && stream)
			{
				stream.pause();
			}
			
			super.onStartedHandler(evt);
			
			if(!_ready)
			{
				_ready = true;
				ready();
			}
		}
		override public function stop():void
		{
			try
			{
				if(stream)
				{
					stream.close();
				}
			}
			catch(e:Error)
			{
				
			}
			
			super.stop();
		}
		override public function cleanListeners():void 
		{
			if(stream) 
			{
				stream.removeEventListener(IOErrorEvent.IO_ERROR, onErrorHandler, false);
				stream.removeEventListener(NetStatusEvent.NET_STATUS, onNetStatus, false);
			}
		}
		override public function destroy():void
		{
			if(stream)
			{
                stream.client = null;
			}
			
			stop();
			cleanListeners();
			
			stream = null;
			
			super.destroy();
		}
		
		
		/*
		 * 
		 * NET STATUS
		 * 
		 */
		protected var _started:Boolean = false;
		internal function onNetStatus(evt:NetStatusEvent):void
		{
			if(!stream)
			{
				return;
			}
			switch(evt.info["code"])
			{
				case NetStatusState.PLAY_STREAM_NOT_FOUND:
					onErrorHandler(_createErrorEvent(new Error("[VideoItem] NetStream not found at " + this.url.url)));
					break;
				
				case NetStatusState.PLAY_START:
					if(!_started)
					{
						_started = true;
						_content = stream;
						
						onStartedHandler(new Event(Event.OPEN));
					}
					break;
				
				case NetStatusState.PLAY_STOP:
//					stream.removeEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
					break;
			}
		}
		
		
		/*
		 * 
		 * CUE POINTS & METADATA
		 * 
		 */
		internal function cuePointHandler(infoObject:Object):void
		{
			// nothing atm
		}
		internal function onMetadata(e:NetStreamClientEvent):void
		{
			_client.removeEventListener(NetStreamClientEvent.META_DATA, onMetadata);
			
			_metaData = _client.metaData;
			
			trace("RTMPItem:onMetadata => " + _metaData["duration"]);
			
			if(!_ready)
			{
				_ready = true;
				ready();
			}
		}
		public function get metaData():Object 
		{
			return _metaData ? _metaData : _metaDataSet;
		}
		
		
		/*
		 * 
		 * PROGRESS
		 * 
		 */
        override public function onProgressHandler(evt:ProgressEvent):void
        {
            var e:BulkProgressEvent = new BulkProgressEvent(BulkLoader.PROGRESS, true, false);
            e._percentLoaded = evt.bytesLoaded / evt.bytesTotal;
            e.bytesLoaded = evt.bytesLoaded;
            e.bytesTotal = evt.bytesTotal;
            
            evt.stopImmediatePropagation();
            
            dispatchEvent(e);
        }
	}
}