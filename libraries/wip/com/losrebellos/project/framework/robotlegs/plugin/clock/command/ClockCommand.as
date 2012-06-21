package com.losrebellos.project.framework.robotlegs.plugin.clock.command
{
	import com.losrebellos.project.framework.robotlegs.plugin.clock.events.ClockEvent;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.model.IClockModel;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class ClockCommand extends Command
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
			switch(event.type)
			{
				case ClockEvent.ADD:
					clockModel.add(event.clockableOrMethod, event.execute);
					break;
					
				case ClockEvent.REMOVE:
					clockModel.remove(event.clockableOrMethod, event.execute);
					break;
					
				case ClockEvent.EMPTY:
					clockModel.empty();
					break;
			}
		}
	}
}