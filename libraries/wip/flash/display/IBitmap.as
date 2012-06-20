package flash.display
{

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IBitmap extends IDisplayObject
	{
		function set bitmapData(value:BitmapData):void;
		function get bitmapData():BitmapData;
		
		
		function set pixelSnapping(value:String):void;
		function get pixelSnapping():String;
		
		
		function set smoothing(value:Boolean):void;
		function get smoothing():Boolean;
	}
}