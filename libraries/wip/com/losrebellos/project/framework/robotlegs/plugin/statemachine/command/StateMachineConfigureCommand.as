package com.losrebellos.project.framework.robotlegs.plugin.statemachine.command
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.IFSMInjector;
	import org.robotlegs.utilities.statemachine.IStateMachine;
	import org.robotlegs.utilities.statemachine.StateMachine;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class StateMachineConfigureCommand extends Command
	{
		[Inject]
		public var fsmInjector:IFSMInjector;
		
		[Inject]
		public var fsm:IStateMachine;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EXECUTE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function execute():void
		{
			fsmInjector.inject(fsm as StateMachine);
		}
	}
}