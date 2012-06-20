package flash.display
{
	import flash.accessibility.AccessibilityProperties;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.geom.Transform;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IDisplayObject extends IEventDispatcher
	{
		function set accessibilityProperties(value:AccessibilityProperties):void;
		function get accessibilityProperties():AccessibilityProperties;
		
		
		function set alpha(value:Number):void;
		function get alpha():Number;
		
		function set blendMode(value:String):void;
		function get blendMode():String;
		
		function set cacheAsBitmap(value:Boolean):void;
		function get cacheAsBitmap():Boolean;
		
		function set filters(value:Array):void;
		function get filters():Array;
		
		function set width(value:Number):void;
		function get width():Number;
		function set height(value:Number):void;
		function get height():Number;
		
		function set mask(value:DisplayObject):void;
		function get mask():DisplayObject;
		
		function set name(value:String):void;
		function get name():String;
		
		function set scale9Grid(innerRectangle:Rectangle):void;
		function get scale9Grid():Rectangle;
		
		function set scaleX(value:Number):void;
		function get scaleX():Number;
		
		function set scaleY(value:Number):void;
		function get scaleY():Number;
		
		function set scrollRect(value:Rectangle):void;
		function get scrollRect():Rectangle;
		
		function set transform(value:Transform):void;
		function get transform():Transform;
		
		function set visible(value:Boolean):void;
		function get visible():Boolean;
		
		function set x(value:Number):void;
		function get x():Number;
		function set y(value:Number):void;
		function get y():Number;
		
		function set rotation(value:Number):void;
		function get rotation():Number;
		
		function set opaqueBackground(value:Object):void;
		function get opaqueBackground():Object;
		
		
		function hitTestObject(obj:DisplayObject):Boolean;
		function hitTestPoint(x:Number, y:Number, shapeFlag:Boolean = false):Boolean;
		
		
		function getBounds(targetCoordinateSpace:DisplayObject):Rectangle;
		function getRect(targetCoordinateSpace:DisplayObject):Rectangle;
		
		
		function get mouseX():Number;
		function get mouseY():Number;
		function globalToLocal(point:Point):Point;
		function localToGlobal(point:Point):Point;
		
		
		function get loaderInfo():LoaderInfo;
		
		function get parent():DisplayObjectContainer;
		
		function get root():DisplayObject;
		
		function get stage():Stage;
	}
}