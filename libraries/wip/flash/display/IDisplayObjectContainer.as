package flash.display
{
	import flash.geom.Point;
	import flash.text.TextSnapshot;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IDisplayObjectContainer extends IInteractiveObject
	{
		function get numChildren():int;
		
		function addChild(child:DisplayObject):DisplayObject;
		function addChildAt(child:DisplayObject, index:int):DisplayObject;
		
		function setChildIndex(child:DisplayObject, index:int):void;
		function getChildAt(index:int):DisplayObject;
		function getChildIndex(child:DisplayObject):int;
		function getChildByName(name:String):DisplayObject;
		
		function swapChildren(child1:DisplayObject, child2:DisplayObject):void;
		function swapChildrenAt(index1:int, index2:int):void;
		
		function removeChild(child:DisplayObject):DisplayObject;
		function removeChildAt(index:int):DisplayObject;
		
		
		function contains(child:DisplayObject):Boolean;
		
		
		function set mouseChildren(enable:Boolean):void;
		function get mouseChildren():Boolean;
		
		
		function set tabChildren(enable:Boolean):void;
		function get tabChildren():Boolean;
		
		
		function get textSnapshot():TextSnapshot;
		
		
		function getObjectsUnderPoint(point:Point):Array;
		
		
		function areInaccessibleObjectsUnderPoint(point:Point):Boolean;
	}
}