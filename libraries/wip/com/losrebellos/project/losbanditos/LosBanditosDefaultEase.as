package com.losrebellos.project.losbanditos 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 * based on Robert Penner's ease equations - http://www.robertpenner.com
	 *
	 */
	public class LosBanditosDefaultEase 
	{
		public static function quadEaseOut(t:Number, b:Number, c:Number, d:Number):Number
		{
			return -c *(t/=d)*(t-2) + b;
		}
	}
}