package com.losrebellos.net {	/*	 *	 * @author los rebellos - ben@benoitvinay.com	 *	 */
	public final class NetStreamStatus	{		//connection		public static const CONNECTION_REJECTED:String		= "Netconnection.Connect.Rejected";		public static const CONNECTION_SUCCESS:String		= "Netconnection.Connect.Success";				//custom		public static const NO_CODE:String					= "NetStream no code found";		public static const NO_DESCRIPTION:String			= "NetStream no description found";		public static const NO_LEVEL:String					= "NetStream no level found";				//codes		public static const BUFFER_EMPTY:String				= "NetStream.Buffer.Empty";		public static const BUFFER_FLUSH:String				= "NetStream.Buffer.Flush";		public static const BUFFER_FULL:String				= "NetStream.Buffer.Full";		public static const PLAY_STREAM_NOT_FOUND:String	= "NetStream.Play.StreamNotFound";		public static const PLAY_START:String				= "NetStream.Play.Start";		public static const PLAY_STOP:String				= "NetStream.Play.Stop";		public static const PAUSE:String					= "NetStream.Pause.Notify";		public static const UNPAUSE:String					= "NetStream.Unpause.Notify";				//levels		public static const LEVEL_STATUS:String				= "status";		public static const LEVEL_WARNING:String			= "warning";		public static const LEVEL_ERROR:String				= "error";	}}