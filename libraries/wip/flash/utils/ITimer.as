package flash.utils
{
	import flash.events.IEventDispatcher;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ITimer extends IEventDispatcher
	{
		function set delay(value:Number):void;
		function get delay():Number;
		
		function get currentCount():int;
		function set repeatCount(value:int):void;
		function get repeatCount():int;
		
		function get running():Boolean;
		
		function start():void;
		function stop():void;
		function reset():void;
	}
}