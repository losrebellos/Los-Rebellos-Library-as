package com.losrebellos.project.media.image
{
	import com.losrebellos.display.base.ISpritePlus;

	import flash.system.LoaderContext;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public interface IIMG extends ISpritePlus
	{
		function load(url:String, context:LoaderContext = null):void;
	}
}