package com.losrebellos.project.framework.robotlegs.plugin.statemachine.view
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.statemachine.IFSMInjector;
	import org.robotlegs.utilities.statemachine.IStateMachine;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class BaseStateMachineMediator extends Mediator
	{
		[Inject]
		public var fsmInjector:IFSMInjector;
		
		[Inject]
		public var fsm:IStateMachine;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BaseStateMachineMediator()
		{
			super();
		}
		
		override public function preRegister() : void {
			super.preRegister();
			addContextListener(StateEvent.CHANGED, onStateChanged);
		}
		
		override public function preRemove() : void {
			super.preRemove();
			removeContextListener(StateEvent.CHANGED, onStateChanged);
			fsmInjector = null;
			fsm = null;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// ACTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function dispatchAction(action:String, data:Object = null):void
		{
			dispatch(new StateEvent(StateEvent.ACTION, action, data));
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// HANDLERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function onStateChanged(e:StateEvent):void
		{
			// need to be overridden
			// and create a swtich block on: fsm.currentStateName
		}
	}
}