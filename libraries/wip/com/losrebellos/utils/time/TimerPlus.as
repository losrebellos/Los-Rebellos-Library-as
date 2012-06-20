package com.losrebellos.utils.time 
{
	import flash.events.TimerEvent;
	import flash.utils.ITimer;
	import flash.utils.Timer;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 * 
	 * refactored from: http://blog.fjakobs.com/archives/101
	 *
	 */
	public class TimerPlus extends Timer implements ITimer
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function TimerPlus(delay:Number, repeatCount:int = 0)
		{
			super(delay, repeatCount); 
			
			_initialDelay = delay;
			
			addEventListener(TimerEvent.TIMER, onTimer); 
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		private function onTimer(event:TimerEvent):void
		{
			_startTime = new Date().time;
			delay = _initialDelay;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTROLS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get paused():Boolean
		{
			return !running;
		}
		private var _startTime:Number;
		override public function start():void
		{
			if(currentCount < repeatCount || repeatCount == 0)
			{
				delay = _initialDelay;
				_startTime = new Date().time;
				
				super.start();
			}
		}
		public function pause():void
		{
			if(running)
			{
				stop();
				
				var delayTemp:Number = delay - (new Date().time - _startTime);
				if(delayTemp < 0)
				{
					delayTemp = 0;
				}
				super.delay = delayTemp;
			}
		}
		public function resume():void
		{
			if(!running && (currentCount < repeatCount || repeatCount == 0))
			{
				_startTime = new Date().time;
				
				super.start();
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DELAY
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function set delay(n:Number):void
		{
			super.delay = _initialDelay = n;
		}
        private var _initialDelay:Number;
		public function get initialDelay():Number
		{
			return _initialDelay;
		}
	}
}