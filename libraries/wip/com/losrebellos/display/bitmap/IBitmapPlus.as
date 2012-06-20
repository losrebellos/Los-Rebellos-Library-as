package com.losrebellos.display.bitmap 
{
	import com.losrebellos.display.base.IDisplayObjectPlus;
	import flash.display.Bitmap;
	import flash.display.IBitmap;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IBitmapPlus extends IBitmap, IDisplayObjectPlus
	{
		function setFromBitmap(b:Bitmap):void;
		
		function clone():BitmapPlus;
		
		function pixelate(amount:Number):void;
	}
}