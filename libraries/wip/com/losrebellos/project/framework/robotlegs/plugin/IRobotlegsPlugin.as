package com.losrebellos.project.framework.robotlegs.plugin
{
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IRobotlegsPlugin
	{
		function get qualifiedClassName():String;
		
		// call once all the injections are in
		function init():void;
		
		function set debug(value:Boolean):void;
		
		function dispose():void;
	}
}