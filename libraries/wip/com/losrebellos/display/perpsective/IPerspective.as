package com.losrebellos.display.perpsective
{
	import com.losrebellos.interfaces.IDisposable;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Point;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IPerspective extends IDisposable
	{
		function update(p1:Point, p2:Point, p3:Point, p4:Point):Point;
		
		function set graphics(value:Graphics):void;
		function get graphics():Graphics;
		
		function set source(value:BitmapData):void;
		function get source():BitmapData;
		
		function get centralPoint():Point;
	}
}