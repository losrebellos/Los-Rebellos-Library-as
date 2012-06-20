package com.losrebellos.display.base
{
	import com.losrebellos.display.invalidate.IInvalidate;
	import com.losrebellos.events.IEventDispatcherPlus;
	import com.losrebellos.interfaces.IDisposable;
	import flash.display.IDisplayObject;
	import flash.events.Event;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IDisplayObjectPlus extends IEventDispatcherPlus, IDisplayObject, IInvalidate, IDisposable
	{
		function set scale(value:Number):void;
		function get scale():Number;
		
		function set index(value:int):void;
		function get index():int;
		function setTopIndex():int;
		
		function remove(e:Event = null):Boolean;
	}
}