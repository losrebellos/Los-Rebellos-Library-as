package losrebellos.display 
{
	import flash.accessibility.AccessibilityImplementation;
	import flash.ui.ContextMenu;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IInteractiveObject 
	{
		function get accessibilityImplementation():AccessibilityImplementation;
		
		
		function set accessibilityImplementation(value:AccessibilityImplementation):void;
		
		
		function get contextMenu():ContextMenu;
		
		
		function set contextMenu(cm:ContextMenu):void;
		
		
		function get doubleClickEnabled():Boolean;
		
		
		function set doubleClickEnabled(enabled:Boolean):void;
		
		
		function get focusRect():Object;
		
		
		function set focusRect(focusRect:Object):void;
		
		
		function get mouseEnabled():Boolean;
		
		
		function set mouseEnabled(enabled:Boolean):void;
		
		
		function get tabEnabled():Boolean;
		
		
		function set tabEnabled(enabled:Boolean):void;
		
		
		function get tabIndex():int;
		
		
		function set tabIndex(index:int):void;
	}
}