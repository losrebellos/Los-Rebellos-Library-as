package com.losrebellos.display.invalidate
{
	import flash.geom.Rectangle;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IInvalidate
	{
		function invalidate():void;
		
		function resize(rect:Rectangle = null):void;
		
		function redraw():void;
	}
}