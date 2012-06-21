package com.losrebellos.project.framework.robotlegs.plugin.video.events
{
	import flash.events.Event;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class NetConnectionEvent extends Event
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static const CALL_BAD_VERSION:String			= "NetConnection.Call.BadVersion";
		public static const CALL_FAILED:String				= "NetConnection.Call.Failed";
		public static const CALL_PROHIBITED:String			= "NetConnection.Call.Prohibited";
		
		public static const CONNECT_APP_SHUT_DOWN:String	= "NetConnection.Connect.AppShutdown";
		public static const CONNECT_CLOSED:String			= "NetConnection.Connect.Closed";
		public static const CONNECT_DESTROYED:String		= "NetConnection.Connect.Destroyed";
		public static const CONNECT_FAILED:String			= "NetConnection.Connect.Failed";
		public static const CONNECT_IDLE_TIMEOUT:String		= "NetConnection.Connect.IdleTimeout";
		public static const CONNECT_INVALID_APP:String		= "NetConnection.Connect.InvalidApp";
		public static const CONNECT_NETWORK_CHANGE:String	= "NetConnection.Connect.NetworkChange";
		public static const CONNECT_REJECTED:String			= "NetConnection.Connect.Rejected";
		public static const CONNECT_SUCCESS:String			= "NetConnection.Connect.Success";
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public var info:Object;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function NetConnectionEvent(type:String, info:Object = null)
		{
			super(type);
			
			this.info = info;
		}
	}
}