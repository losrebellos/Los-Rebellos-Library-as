package com.losrebellos.project.framework.robotlegs.plugin.clock
{
	import com.losrebellos.project.framework.robotlegs.plugin.RobotlegsPlugin;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.command.ClockCommand;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.command.ClockDebugCommand;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.events.ClockEvent;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.model.ClockModel;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.model.IClockModel;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class ClockPlugin extends RobotlegsPlugin
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function ClockPlugin()
		{
			super();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INIT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function init():void
		{
			// model
			injector.mapSingletonOf(IClockModel, ClockModel);
			
			// commands
			commandMap.mapEvent(ClockEvent.ADD, ClockCommand, ClockEvent);
			commandMap.mapEvent(ClockEvent.REMOVE, ClockCommand, ClockEvent);
			commandMap.mapEvent(ClockEvent.EMPTY, ClockCommand, ClockEvent);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DEBUG
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function set debug(value:Boolean):void
		{
			if(value)
			{
				commandMap.mapEvent(ClockEvent.ADD, ClockDebugCommand, ClockEvent);
				commandMap.mapEvent(ClockEvent.REMOVE, ClockDebugCommand, ClockEvent);
				commandMap.mapEvent(ClockEvent.EMPTY, ClockDebugCommand, ClockEvent);
			}
			else
			{
				commandMap.unmapEvent(ClockEvent.ADD, ClockDebugCommand, ClockEvent);
				commandMap.unmapEvent(ClockEvent.REMOVE, ClockDebugCommand, ClockEvent);
				commandMap.unmapEvent(ClockEvent.EMPTY, ClockDebugCommand, ClockEvent);
			}
		}
	}
}