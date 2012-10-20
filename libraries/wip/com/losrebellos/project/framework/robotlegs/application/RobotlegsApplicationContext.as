package com.losrebellos.project.framework.robotlegs.application
{
	import com.losrebellos.project.framework.robotlegs.mvcs.BaseContext;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public class RobotlegsApplicationContext extends BaseContext
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function RobotlegsApplicationContext(contextView:IRobotlegsApplication)
		{
			super(contextView as DisplayObjectContainer);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// START UP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function startup():void
		{
			// templates
			setupPlugins();
			setupMediators();
			setupModels();
			setupServices();
			
			// start up
			super.startup();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// TEMPlATES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function setupPlugins():void
		{
			
		}
		protected function setupMediators():void
		{
			
		}
		protected function setupModels():void
		{
			
		}
		protected function setupServices():void
		{
			
		}
	}
}