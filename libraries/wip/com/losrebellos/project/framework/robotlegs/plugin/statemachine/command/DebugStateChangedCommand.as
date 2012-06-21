package com.losrebellos.project.framework.robotlegs.plugin.statemachine.command
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class DebugStateChangedCommand extends Command
	{
		[Inject]
		public var event:StateEvent;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EXECUTE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function execute():void
		{
			trace("DebugStateChangedCommand.execute, state has changed to => " + event.action);
		}
	}
}