package com.losrebellos.display.base
{
	import com.losrebellos.interfaces.IGraphics;
	import flash.display.ISprite;


	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ISpritePlus extends ISprite, IDisplayObjectContainerPlus, IGraphics
	{
		function set button(value:Boolean):void;
		function get button():Boolean;
	}
}