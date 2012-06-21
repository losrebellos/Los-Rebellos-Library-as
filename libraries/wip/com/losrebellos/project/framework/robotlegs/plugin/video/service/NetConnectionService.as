package com.losrebellos.project.framework.robotlegs.plugin.video.service
{
	import com.losrebellos.project.framework.robotlegs.plugin.video.events.NetConnectionEvent;

	import org.robotlegs.mvcs.Actor;

	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class NetConnectionService extends Actor implements INetConnectionService
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function NetConnectionService()
		{
			super();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONNECTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _connection:NetConnection;
		public function get connection():NetConnection
		{
			return _connection;
		}
		public function get connected():Boolean
		{
			return _connection ? _connection.connected : false;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// MODE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static const MODE_AUTO_RECONNECT:String		= "NetConnectionService/reconnect/auto";
		public static const MODE_NO_RECONNECT:String		= "NetConnectionService/reconnect/no";
		private var _mode:String = MODE_AUTO_RECONNECT;
		public function set mode(value:String):void
		{
			_mode = value;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONNECT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _command:String;
		private var _args:*;
		public function connect(command:String = null, ...args:*):void
		{
			// if connection doesn't exist
			if(!_connection)
			{
				_connection = new NetConnection();
				_connection.addEventListener(NetStatusEvent.NET_STATUS, onConnectionNetStatus, false, 0, true);
			}
			
			// if not connected
			if(!_connection.connected)
			{
				_connection.connect(_command = command, _args = args);
			}
			
			// if connected
			else
			{
				dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_SUCCESS));
			}
		}
		public function reconnect():void
		{
			connect(_command, _args);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CLOSE / DESTROY
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function close():void
		{
			if(_connection)
			{
				_connection.removeEventListener(NetStatusEvent.NET_STATUS, onConnectionNetStatus);
				if(_connection.connected)
				{
					_connection.close();
				}
			}
			
			dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_CLOSED));
		}
		public function destroy():void
		{
			close();
			
			_connection = null;
			
			dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_DESTROYED));
		}
		
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// NET STATUS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function onConnectionNetStatus(e:NetStatusEvent):void
		{
			switch(e.info["code"])
			{
				case "NetConnection.Call.BadVersion":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CALL_BAD_VERSION, e.info));
					break;
					
				case "NetConnection.Call.Failed":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CALL_FAILED, e.info));
					break;
					
				case "NetConnection.Call.Prohibited":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CALL_PROHIBITED, e.info));
					break;
					
				case "NetConnection.Connect.AppShutdown":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_APP_SHUT_DOWN, e.info));
					break;
					
				case "NetConnection.Connect.Closed":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_CLOSED, e.info));
					if(_mode == MODE_AUTO_RECONNECT)
					{
						reconnect();
					}
					break;
					
				case "NetConnection.Connect.Failed":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_FAILED, e.info));
					break;
					
				case "NetConnection.Connect.IdleTimeout":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_IDLE_TIMEOUT, e.info));
					break;
					
				case "NetConnection.Connect.InvalidApp":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_INVALID_APP, e.info));
					break;
					
				case "NetConnection.Connect.NetworkChange":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_NETWORK_CHANGE, e.info));
					break;
					
				case "NetConnection.Connect.Rejected":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_REJECTED, e.info));
					break;
					
				case "NetConnection.Connect.Success":
					dispatch(new NetConnectionEvent(NetConnectionEvent.CONNECT_SUCCESS, e.info));
					break;
					
			}
		}
	}
}