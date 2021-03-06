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
	public final class CountDown extends EventDispatcherPlus implements ICountDown
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private const TIMER_DELAY:int					= 1000;
		
		// utils for calculation
		public static const TIME_FORMAT_SECONDS:int		= 1000;
		public static const TIME_FORMAT_MINUTES:int		= TIME_FORMAT_SECONDS * 60;
		public static const TIME_FORMAT_HOURS:int		= TIME_FORMAT_MINUTES * 60;
		public static const TIME_FORMAT_DAYS:int		= TIME_FORMAT_DAYS * 24;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _endTime:Number;
		private var _currentDate:Date;		// _currentDate in Date in case you getting the current time from a server
		private var _offset:Number = 0;
		private var _timer:Timer;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function CountDown(date:Date, currentDate:Date = null)
		{
			super();
			
			_endTime = date.valueOf();
			
			if(currentDate)
			{
				_currentDate = currentDate;
				_offset = (new Date()).valueOf() - currentDate.valueOf();
			}
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INTERACTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function enable():void
		{
			_timer = new Timer(TIMER_DELAY);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.start();
			
			update();
		}
		public function disable():void
		{
			_timer.removeEventListener(TimerEvent.TIMER, onTimer);
			_timer.stop();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// TIMER
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function onTimer(e:TimerEvent):void
		{
			update();
		}
		private function update():void
		{
			this.dispatchEvent(new CountDownEvent(CountDownEvent.UPDATE, _endTime.valueOf() - (new Date().valueOf()) - _offset));
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose(e:Event = null):void
		{
			disable();
			
			_timer = null;
			_currentDate = null;
		}
	}
}