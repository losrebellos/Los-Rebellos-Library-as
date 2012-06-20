package com.losrebellos.project.time 
{
	import com.losrebellos.events.EventDispatcherPlus;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class ServerTime extends EventDispatcherPlus implements IServerTime
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _loader:URLLoader;
		public var timeZone:Number;
		public var serverTime:Date;
		public var serverTimeUTC:Number;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function ServerTime()
		{
			super();
			
			_loader = new URLLoader();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function addEvents():void
		{
			_loader.addEventListener(Event.COMPLETE, onComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		}
		protected function removeEvents():void
		{
			_loader.removeEventListener(Event.COMPLETE, onComplete);
			_loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			_loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOAD
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function load(url:String):void
		{
			addEvents();
			_loader.load(new URLRequest(url));
		}
		private function onComplete(e:Event):void
		{
			removeEvents();
			parseData(URLLoader(e.target).data);
			
			this.dispatchEvent(new ServerTimeEvent(ServerTimeEvent.COMPLETE, timeZone, serverTimeUTC, serverTime));
		}
		private function onError(e:Event):void
		{
			removeEvents();
			
			this.dispatchEvent(e.clone());
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PARSE DATA
		// data format: {timezone:int, time:int}
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function parseData(data:String):void
		{
			var timeData:Array = data.split(",");
			timeZone = Number(String(timeData[0]).split(":")[1]);
			serverTimeUTC = Number(String(timeData[1]).split(":")[1]);
			serverTime = new Date(int(String(timeData[1]).split(":")[1]) * 1000);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose(e:Event = null):void
		{
			if(_loader)
			{
				removeEvents();
				
				_loader.close();
				_loader = null;
			}
		}
	}
}