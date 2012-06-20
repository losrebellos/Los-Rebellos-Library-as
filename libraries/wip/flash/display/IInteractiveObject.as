package flash.display
{
	import flash.accessibility.AccessibilityImplementation;
	import flash.ui.ContextMenu;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IInteractiveObject extends IDisplayObject
	{
		function set accessibilityImplementation(value:AccessibilityImplementation):void;
		function get accessibilityImplementation():AccessibilityImplementation;
		
		
		function set contextMenu(cm:ContextMenu):void;
		function get contextMenu():ContextMenu;
		
		
		function set doubleClickEnabled(enabled:Boolean):void;
		function get doubleClickEnabled():Boolean;
		
		
		function set focusRect(focusRect:Object):void;
		function get focusRect():Object;
		
		
		function set mouseEnabled(enabled:Boolean):void;
		function get mouseEnabled():Boolean;
		
		
		function set tabEnabled(enabled:Boolean):void;
		function get tabEnabled():Boolean;
		
		function set tabIndex(index:int):void;
		function get tabIndex():int;
	}
}