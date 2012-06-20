package com.losrebellos.display.base
{

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IInteractiveObjectPlus extends IDisplayObjectPlus
	{
		function set mouse(value:Boolean):void;
		function get mouse():Boolean;
	}
}