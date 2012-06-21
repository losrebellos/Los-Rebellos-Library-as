package com.losrebellos.project.framework.robotlegs.plugin.clock.model
{
	import flash.events.IEventDispatcher;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IClockModel
	{
		function add(clockableOrMethod:*, execute:Boolean = false):void;
		function has(clockableOrMethod:*):Boolean;
		function remove(clockableOrMethod:*, execute:Boolean = false):Boolean;
		
		function get length():int;
		function empty():void;
		
		function addListeners(dispatcher:IEventDispatcher):void;
		function removeListeners(dispatcher:IEventDispatcher):void;
	}
}