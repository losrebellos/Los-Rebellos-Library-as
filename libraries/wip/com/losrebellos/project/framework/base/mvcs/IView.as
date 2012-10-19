package com.losrebellos.project.framework.base.mvcs
{
	import com.losrebellos.display.base.ISpritePlus;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public interface IView extends ISpritePlus
	{
		function show():void;
		function hide():void;
	}
}