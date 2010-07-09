package losrebellos.display 
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.text.TextSnapshot;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IDisplayObjectContainerPlus extends IInteractiveObjectPlus
	{
		/*
		 * 
		 * DEFAULT
		 * 
		 */
		function addChild(child:DisplayObject):DisplayObject;

		
		function getChildByName(name:String):DisplayObject;

		
		function get textSnapshot():TextSnapshot;

		
		function getChildIndex(child:DisplayObject):int;

		
		function set mouseChildren(enable:Boolean):void;

		
		function setChildIndex(child:DisplayObject, index:int):void;

		
		function addChildAt(child:DisplayObject, index:int):DisplayObject;

		
		function contains(child:DisplayObject):Boolean;

		
		function get numChildren():int;

		
		function swapChildrenAt(index1:int, index2:int):void;

		
		function get tabChildren():Boolean;

		
		function getChildAt(index:int):DisplayObject;

		
		function swapChildren(child1:DisplayObject, child2:DisplayObject):void;

		
		function getObjectsUnderPoint(point:Point):Array;

		
		function get mouseChildren():Boolean;

		
		function removeChildAt(index:int):DisplayObject;

		
		function set tabChildren(enable:Boolean):void;

		
		function areInaccessibleObjectsUnderPoint(point:Point):Boolean;

		
		function removeChild(child:DisplayObject):DisplayObject;
		
		
		/*
		 * 
		 * CUSTOM
		 * 
		 */
		function getAllChildren():Array;
		
		function removeAllChildren():void;
	}
}