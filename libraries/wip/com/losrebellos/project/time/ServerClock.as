package com.losrebellos.project.time 
{
	import com.losrebellos.events.EventDispatcherPlus;

	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class ServerClock extends EventDispatcherPlus implements IServerClock
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static const DEFAULT_REFRESH_FREQUENCY:int	= 30000;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _url:String;
		private var _rfms:int;
		private var _serverTime:IServerTime;
		private var _timer:Timer;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function ServerClock(url:String, refreshFrequencyMS:int = DEFAULT_REFRESH_FREQUENCY)
		{
			super();
			
			_url = url;
			_rfms = refreshFrequencyMS;
			_timer = new Timer(_rfms);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INTERACTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function enable():void
		{
			createServerTime();
			
			_timer.addEventListener(TimerEvent.TIMER, getServerTimerHandler);
			_timer.start();
		}
		public function disable():void
		{
			if(_timer)
			{
				_timer.removeEventListener(TimerEvent.TIMER, getServerTimerHandler);
				_timer.stop();
			}
			
			if(_serverTime)
			{
				disposeServerTime();
			}
		}
		private function getServerTimerHandler(e:TimerEvent):void
		{
			disposeServerTime();
			createServerTime();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SERVER TIME
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function createServerTime():void
		{
			_serverTime = new ServerTime();
			_serverTime.addEventListener(ServerTimeEvent.COMPLETE, onServerTimeComplete);
			_serverTime.load(_url);
		}
		private function disposeServerTime():void
		{
			_serverTime.removeEventListener(ServerTimeEvent.COMPLETE, onServerTimeComplete);
			_serverTime.dispose();
			_serverTime = null;
		}
		private function onServerTimeComplete(e:ServerTimeEvent):void
		{
			dispatchEvent(e);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose(e:Event = null):void
		{
			disable();
			
			_serverTime.dispose(e);
			_serverTime = null;
			
			_timer = null;
		}
	}
}