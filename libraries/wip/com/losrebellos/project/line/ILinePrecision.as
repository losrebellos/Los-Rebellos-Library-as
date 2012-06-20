package com.losrebellos.project.line
{
	import flash.geom.Point;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ILinePrecision
	{
		function get points():Vector.<Point>;
		
		function get direction():Number;
		function get directionDegrees():Number;
		
		function get precision():Number;
		function calculatePrecision(distanceMaximum:Number):Number;
	}
}