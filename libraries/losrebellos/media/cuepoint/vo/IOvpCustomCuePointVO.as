package losrebellos.media.cuepoint.vo 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IOvpCustomCuePointVO 
	{
		function parse(xml:XML, split:Boolean = false, delimit:String = "/"):void;
		function doSplit(delimit:String = "/"):Array;
		
		function set time(value:Number):void;
		function get time():Number;
		
		function set type(value:String):void;
		function get type():String;
		
		function set name(value:String):void;
		function get name():String;
		
		function set nameSplit(value:Array):void;
		function get nameSplit():Array;
	}
}