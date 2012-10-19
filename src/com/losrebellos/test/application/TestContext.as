package com.losrebellos.test.application
{
	import com.losrebellos.project.framework.robotlegs.application.IRobotlegsApplication;
	import com.losrebellos.project.framework.robotlegs.application.RobotlegsApplicationContext;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.StateMachinePlugin;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.constants.StateMachinePluginConstants;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public final class TestContext extends RobotlegsApplicationContext
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function TestContext(contextView:IRobotlegsApplication)
		{
			super(contextView);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// START UP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override protected function setupPlugins():void
		{
			registerPlugin(new StateMachinePlugin(StateMachinePluginConstants.TEST_FSM));
		}
		override protected function setupMediators():void
		{
			mediatorMap.mapView(TestMain, TestMainController);
		}
	}
}