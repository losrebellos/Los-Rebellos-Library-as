package com.losrebellos.display.bitmapdata
{
	import flash.display.IBitmapDrawable;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class BitmapDataDraw extends BitmapDataPlus
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BitmapDataDraw(source:IBitmapDrawable, width:int, height:int, transparent:Boolean = true, fillColor:uint = 4.294967295E9, matrix:Matrix = null, colorTransform:ColorTransform = null, blendMode:String = null, clipRect:Rectangle = null, smoothing:Boolean = false)
		{
			super(width, height, transparent, fillColor);
			draw(source, matrix, colorTransform, blendMode, clipRect, smoothing);
		}
	}
}