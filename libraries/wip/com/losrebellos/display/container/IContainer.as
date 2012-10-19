package com.losrebellos.display.container
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IContainer
	{
		function get children():Vector.<DisplayObject>;
		
		function applyChildren(Clazz:Class, method:String, ...args):void;
		
		function removeChildren():void;
		
		function resizeChildren():void;
		function renderChildren():void;
		
		function disposeChildren(e:Event = null):void;
	}
}