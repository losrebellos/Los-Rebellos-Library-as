package losrebellos.display 
{
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IloaderPlus extends IDisplayObjectContainerPlus 
	{
		function addChild(child:DisplayObject):DisplayObject;
		
		
		function addChildAt(child:DisplayObject, index:int):DisplayObject;
		
		
		function close():void;
		
		
		function get content():DisplayObject;
		
		
		function get contentLoaderInfo():LoaderInfo;
		
		
		function load(request:URLRequest, context:LoaderContext = null):void;
		
		
		function loadBytes(bytes:ByteArray, context:LoaderContext = null):void;
		
		
		function removeChild(child:DisplayObject):DisplayObject;
		
		
		function removeChildAt(index:int):DisplayObject;
		
		
		function setChildIndex(child:DisplayObject, index:int):void;
		
		
		function unload():void;
	}
}