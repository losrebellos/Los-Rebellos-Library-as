package com.losrebellos.interfaces
{
	import flash.display.DisplayObject;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IContainer
	{
		function getAllChildren():Vector.<DisplayObject>;
		
		function removeAllChildren():void;
	}
}