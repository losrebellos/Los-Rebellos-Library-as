package com.losrebellos.project.framework.robotlegs.plugin.statemachine.command
{
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.view.StateMachineDebug;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class StateMachineConfigureDebugCommand extends StateMachineConfigureCommand
	{
		[Inject]
		public var debug:StateMachineDebug;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EXECUTE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function execute():void
		{
			// if it doesn't have a container
			// we add it in the contextView
			if(debug && !debug.parent)
			{
				contextView.addChild(debug);
			}
			//
			
			super.execute();
		}
	}
}