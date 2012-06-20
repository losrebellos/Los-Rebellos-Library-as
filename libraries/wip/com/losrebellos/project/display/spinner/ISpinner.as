package com.losrebellos.project.display.spinner 
{
	import com.losrebellos.display.base.IDisplayObjectContainerPlus;
	import com.losrebellos.interfaces.IDisposable;
	import com.losrebellos.interfaces.IInteractive;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface ISpinner extends IDisplayObjectContainerPlus, IInteractive, IDisposable
	{
		function set x(value:Number):void;
		function set y(value:Number):void;
		
		function set speed(value:int):void;
		
		function set circle(value:int):void;
	}
}