package com.losrebellos.project.framework.robotlegs.mvcs
{
	import com.losrebellos.project.framework.robotlegs.plugin.IRobotlegsPlugin;

	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;
	import flash.utils.getDefinitionByName;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public class BaseContext extends Context
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BaseContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PLUGINS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function registerPlugin(plugin:IRobotlegsPlugin):IRobotlegsPlugin
		{
			injector.injectInto(plugin);
			injector.mapValue(getDefinitionByName(plugin.qualifiedClassName) as Class, plugin);		// allow to inject the plugin
			plugin.init();
			
			return plugin;
		}
	}
}