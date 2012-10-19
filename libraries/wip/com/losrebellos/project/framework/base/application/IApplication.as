package com.losrebellos.project.framework.base.application
{
	import com.losrebellos.interfaces.IInteractive;
	import com.losrebellos.project.framework.base.application.preloader.IApplicationPreloader;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IApplication extends IInteractive
	{
		function set preloader(value:IApplicationPreloader):void;
	}
}