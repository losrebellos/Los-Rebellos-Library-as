package com.losrebellos.old.external.bulkloader.loadingtypes 
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import br.com.stimuli.loading.loadingtypes.LoadingItem;
	import com.losrebellos.net.NetStreamStatus;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import org.openvideoplayer.events.OvpEvent;
	import org.openvideoplayer.net.OvpConnection;
	import org.openvideoplayer.net.OvpNetStream;










	/** @private */
	public class OvpRTMPItem extends LoadingItem 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		private var _netConnection:OvpConnection;
		public var stream:OvpNetStream;
		private var _metaData:Object;
		private var _metaDataSet:Object;
		public var pausedAtStart:Boolean = false;

		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function OvpRTMPItem(url:URLRequest, type:String, uid:String)
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
			
			stream = new OvpNetStream(_netConnection);
			stream.addEventListener(OvpEvent.NETSTREAM_METADATA, netStreamMetaDataHandler, false, 0, true);
			stream.addEventListener(OvpEvent.STREAM_LENGTH, streamLengthHandler, false, 0, true);
			stream.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler, false, 0, true);
			stream.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityErrorHandler, false, 0, true);
			stream.addEventListener(NetStatusEvent.NET_STATUS, onNetStatus, false, 0, true);
			stream.play(url.url, 0, -1);
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
				stream.seek(0);
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
				stream.removeEventListener(OvpEvent.NETSTREAM_METADATA, netStreamMetaDataHandler);
				stream.removeEventListener(OvpEvent.STREAM_LENGTH, streamLengthHandler);
				stream.removeEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
				stream.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityErrorHandler);
				stream.removeEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
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
				case NetStreamStatus.PLAY_STREAM_NOT_FOUND:
					onErrorHandler(_createErrorEvent(new Error("[OvpRTMPItem] NetStream not found at " + this.url.url)));
					break;
				
				case NetStreamStatus.PLAY_START:
					if(!_started)
					{
						_started = true;
						_content = stream;
						
						onStartedHandler(new Event(Event.OPEN));
					}
					break;
				
				case NetStreamStatus.PLAY_STOP:
//					stream.removeEventListener(NetStatusEvent.NET_STATUS, onNetStatus);
					break;
			}
		}
		
		
		/*
		 * 
		 * CUE POINTS & METADATA
		 * 
		 */
		private function netStreamMetaDataHandler(e:OvpEvent):void
		{
			stream.removeEventListener(OvpEvent.NETSTREAM_METADATA, netStreamMetaDataHandler);
			
			_metaData = e.data;
			
			if(!_ready)
			{
				_ready = true;
				ready();
			}
		}
		private function streamLengthHandler(e:OvpEvent):void
		{
			stream.removeEventListener(OvpEvent.STREAM_LENGTH, streamLengthHandler);
			
			_metaData = _metaData ? _metaData : new Object();
			_metaData["duration"] = e.data["streamLength"];
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