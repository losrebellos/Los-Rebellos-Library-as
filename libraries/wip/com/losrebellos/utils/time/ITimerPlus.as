package com.losrebellos.utils.time
{
	import flash.utils.ITimer;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ITimerPlus extends ITimer
	{
		function get paused():Boolean;
		function pause():void
		function resume():void;
		
		function get initialDelay():Number;
	}
}