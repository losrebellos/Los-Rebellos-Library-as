package com.losrebellos.project.framework.robotlegs.plugin.clock.command
{
	import com.losrebellos.project.framework.robotlegs.plugin.clock.events.ClockEvent;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.model.IClockModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class ClockDebugCommand extends Command
	{
		[Inject]
		public var event:ClockEvent;
		
		[Inject]
		public var clockModel:IClockModel;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EXECUTE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function execute():void
		{
			trace("ClockDebugCommand.execute => " + event.type + ": " + clockModel.length);
		}
	}
}