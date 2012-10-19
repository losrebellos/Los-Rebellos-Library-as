package com.losrebellos.project.framework.robotlegs.plugin.statemachine.manager
{
	import flash.events.IEventDispatcher;
	
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IStateMachineManager
	{
		function set eventDispatcher(value:IEventDispatcher):void;
		function get eventDispatcher():IEventDispatcher;
	}
}