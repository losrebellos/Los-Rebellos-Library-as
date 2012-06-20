package flash.text
{
	import flash.events.IEventDispatcher;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IStyleSheet extends IEventDispatcher
	{
		function parseCSS(CSSText:String):void;
		function setStyle(styleName:String, styleObject:Object):void;
		
		function get styleNames():Array;
		function getStyle(styleName:String):Object;
		
		function transform(formatObject:Object):TextFormat;
		
		function clear():void;
	}
}