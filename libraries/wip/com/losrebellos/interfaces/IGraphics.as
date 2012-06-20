package com.losrebellos.interfaces
{
	import flash.display.Graphics;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IGraphics
	{
		function get g():Graphics;
		
		// useful for debugging and simple graphical stuffs
		function drawCircle(x:Number = 0, y:Number = 0, radius:Number = 50, color:uint = 0xff0000, alpha:Number = .5):void;
		function drawRect(x:Number = 0, y:Number = 0, width:Number = 50, height:Number = 50, color:uint = 0xff0000, alpha:Number = .5):void;
		function drawRoundRect(x:Number = 0, y:Number = 0, width:Number = 50, height:Number = 50, color:uint = 0xff0000, alpha:Number = .5, ellipseWidth:Number = 10, ellipseHeight:Number = undefined):void;
	}
}
