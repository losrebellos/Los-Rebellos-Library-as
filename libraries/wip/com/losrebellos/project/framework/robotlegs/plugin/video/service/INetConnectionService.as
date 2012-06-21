package com.losrebellos.project.framework.robotlegs.plugin.video.service
{
	import flash.net.NetConnection;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface INetConnectionService
	{
		function get connection():NetConnection;
		function get connected():Boolean;
		
		function set mode(value:String):void;
		
		function connect(command:String = null, ...args:*):void;
		function reconnect():void;
		
		function close():void;
		function destroy():void;
	}
}