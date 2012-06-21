package com.losrebellos.project.framework.robotlegs.plugin.statemachine.constants
{
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class StateMachinePluginConstants
	{
		public static const DEBUG_MARGIN:int			= 10;
		
		public static const TEST_STATE_OPENED:String	= "state/opened";
		public static const TEST_STATE_CLOSED:String	= "state/closed";
		public static const TEST_STATE_LOCKED:String	= "state/locked";
		public static const TEST_ACTION_OPEN:String		= "action/open";
		public static const TEST_ACTION_CLOSE:String	= "action/close";
		public static const TEST_ACTION_LOCK:String		= "action/lock";
		public static const TEST_ACTION_UNLOCK:String	= "action/unlock";
		
		public static const TEST_FSM:XML				= <fsm initial={TEST_STATE_CLOSED}>
															<state name={TEST_STATE_OPENED}>
																<transition action={TEST_ACTION_CLOSE} target={TEST_STATE_CLOSED}/>
															</state>
															<state name={TEST_STATE_CLOSED}>
																<transition action={TEST_ACTION_OPEN} target={TEST_STATE_OPENED}/>
																<transition action={TEST_ACTION_LOCK} target={TEST_STATE_LOCKED}/>
															</state>
															<state name={TEST_STATE_LOCKED}>
																<transition action={TEST_ACTION_UNLOCK} target={TEST_STATE_OPENED}/>
															</state>
														</fsm>;
	}
}