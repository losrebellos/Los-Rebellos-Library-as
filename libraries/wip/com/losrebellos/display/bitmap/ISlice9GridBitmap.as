package com.losrebellos.display.bitmap {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ISlice9GridBitmap extends IBitmapPlus
	{
		function set sourceBitmapData(value:BitmapData):void;
		function get sourceBitmapData():BitmapData;
		
		function set slice9Grid(value:Rectangle):void;
		function get slice9Grid():Rectangle;
	}
}