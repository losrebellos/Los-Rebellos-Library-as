package flash.display
{
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface Iloader extends IDisplayObjectContainer
	{
		function get content():DisplayObject;
		function get contentLoaderInfo():LoaderInfo;
		
		
		function load(request:URLRequest, context:LoaderContext = null):void;
		function loadBytes(bytes:ByteArray, context:LoaderContext = null):void;
		
		function close():void;
		function unload():void;
	}
}