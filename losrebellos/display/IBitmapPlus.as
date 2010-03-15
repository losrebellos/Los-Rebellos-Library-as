package losrebellos.display 
{
	import flash.display.BitmapData;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IBitmapPlus extends IDisplayObjectPlus 
	{
		function get bitmapData():BitmapData;
		
		
		function set bitmapData(value:BitmapData):void;
		
		
		function get pixelSnapping():String;
		
		
		function set pixelSnapping(value:String):void;
		
		
		function get smoothing():Boolean;
		
		
		function set smoothing(value:Boolean):void;
	}
}