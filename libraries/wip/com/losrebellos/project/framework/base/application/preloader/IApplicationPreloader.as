package com.losrebellos.project.framework.base.application.preloader
{
	import com.losrebellos.interfaces.IInteractive;
	import com.losrebellos.project.framework.base.mvcs.IViewContainer;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public interface IApplicationPreloader extends IViewContainer, IInteractive
	{
		function get preloaderView():IApplicationPreloaderView;
	}
}