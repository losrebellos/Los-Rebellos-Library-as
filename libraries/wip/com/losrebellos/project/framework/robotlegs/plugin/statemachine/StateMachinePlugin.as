package com.losrebellos.project.framework.robotlegs.plugin.statemachine
{
	import com.losrebellos.project.framework.robotlegs.plugin.RobotlegsPlugin;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.command.DebugStateChangedCommand;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.command.StateMachineConfigureCommand;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.command.StateMachineConfigureDebugCommand;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.view.StateMachineDebug;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.view.StateMachineDebugController;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.utilities.statemachine.FSMInjector;
	import org.robotlegs.utilities.statemachine.IFSMInjector;
	import org.robotlegs.utilities.statemachine.IStateMachine;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import org.robotlegs.utilities.statemachine.StateMachine;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class StateMachinePlugin extends RobotlegsPlugin
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _fsmInjector:IFSMInjector;
		private var _fsm:IStateMachine;
		private var _event:String;
		private var _fsmXML:XML;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function StateMachinePlugin(fsmXML:XML, event:String = ContextEvent.STARTUP_COMPLETE)
		{
			_fsmXML = fsmXML;
			_event = event;		// when the fsm should start
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INIT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function init():void
		{
			_fsmInjector = new FSMInjector(_fsmXML);
			_fsm = new StateMachine(eventDispatcher);
			
			// injector
			injector.mapValue(IFSMInjector, _fsmInjector);
			injector.mapValue(IStateMachine, _fsm);
			
			// configure
			commandMap.mapEvent(_event, StateMachineConfigureCommand);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DEBUG
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function set debug(value:Boolean):void
		{
			if(value)
			{
				commandMap.mapEvent(StateEvent.CHANGED, DebugStateChangedCommand, StateEvent);
				
				// injections are forced
				// so the debug view can be moved in any other container
				var stateMachineDebug:StateMachineDebug = new StateMachineDebug();
				var stateMachineDebugMediator:StateMachineDebugController = new StateMachineDebugController();
				injector.injectInto(stateMachineDebugMediator);
				mediatorMap.registerMediator(stateMachineDebug, stateMachineDebugMediator);
				injector.mapValue(StateMachineDebug, stateMachineDebug);
				
				// replace the configure command for the debug one
				commandMap.unmapEvent(_event, StateMachineConfigureCommand);
				commandMap.mapEvent(_event, StateMachineConfigureDebugCommand);
			}
		}
	}
}