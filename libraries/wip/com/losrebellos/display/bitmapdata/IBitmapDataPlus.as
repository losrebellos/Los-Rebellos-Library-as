package com.losrebellos.display.bitmapdata 
{
	import flash.display.IBitmapData;
	import flash.geom.Matrix;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IBitmapDataPlus extends IBitmapData
	{
		function indexColours():Vector.<Object>;
		
		function rotate90CCW():BitmapDataPlus;
		function rotate90CW():BitmapDataPlus;
		function rotate180():BitmapDataPlus;
		
		function cloneWithMatrix(width:int, height:int, matrix:Matrix):BitmapDataPlus;
		function flipHorizontal():BitmapDataPlus;
		function flipVertical():BitmapDataPlus;
	}
}