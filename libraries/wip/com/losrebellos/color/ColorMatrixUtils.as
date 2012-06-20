package com.losrebellos.color 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */	
	public final class ColorMatrixUtils 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// NORMAL COLOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static const NORMAL_COLOR:Array = [
													1, 0, 0, 0, 0,		// red
													0, 1, 0, 0, 0,		// green
													0, 0, 1, 0, 0,		// blue
													0, 0, 0, 1, 0		// alpha
												];
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// GREY SCALE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static var GREY_SCALE:Array = [
												RGB.GREY_SCALE.red, RGB.GREY_SCALE.green, RGB.GREY_SCALE.blue, 0, 0,	// red
												RGB.GREY_SCALE.red, RGB.GREY_SCALE.green, RGB.GREY_SCALE.blue, 0, 0,	// green
												RGB.GREY_SCALE.red, RGB.GREY_SCALE.green, RGB.GREY_SCALE.blue, 0, 0,	// blue
												0, 0, 0, 1, 0															// alpha
											];

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// BLACK AND WHITE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function BLACK_WHITE(threshold:int):Array
		{
			return [
						RGB.BLACK_WHITE.red, RGB.BLACK_WHITE.green, RGB.BLACK_WHITE.blue, 0, -256 * threshold,		// red
						RGB.BLACK_WHITE.red, RGB.BLACK_WHITE.green, RGB.BLACK_WHITE.blue, 0, -256 * threshold,		// green
						RGB.BLACK_WHITE.red, RGB.BLACK_WHITE.green, RGB.BLACK_WHITE.blue, 0, -256 * threshold,		// blue
						0, 0, 0, 1, 0																				// alpha
					];
		}
	}
}