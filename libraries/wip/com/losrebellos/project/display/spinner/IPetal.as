package com.losrebellos.project.display.spinner 
{
	import com.losrebellos.interfaces.IDisposable;
	import com.losrebellos.interfaces.IInteractive;

	import flash.display.IDisplayObject;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPetal extends IDisplayObject, IInteractive, IDisposable
	{
		function update(percent:Number):void
	}
}