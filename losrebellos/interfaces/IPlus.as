package losrebellos.interfaces {	import flash.display.DisplayObject;	import flash.events.Event;	import flash.geom.Point;	import flash.geom.Rectangle;	/*	 *	 * @author los rebellos	 *	 */	public interface IPlus 	{		function set scale(value:Number):void;		function get scale():Number;				function set index(value:int):void;		function get index():int;				function setTopIndex():int;				function dispose(e:Event = null):DisplayObject;				function position(point:Point):void;		function resize(rect:Rectangle):void;	}}