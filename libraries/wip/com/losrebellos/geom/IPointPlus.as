package com.losrebellos.geom 
{
	import flash.geom.IPoint;
	import flash.geom.Point;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPointPlus extends IPoint
	{
		function angle(p:Point):Number;
	}
}
