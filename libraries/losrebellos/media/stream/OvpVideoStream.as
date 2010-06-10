package losrebellos.media.stream 
{
	import losrebellos.console.Console;
	import losrebellos.events.NetStreamClientEvent;
	import losrebellos.media.Library;
	import losrebellos.net.NetStreamClient;

	import org.openvideoplayer.events.OvpEvent;
	import org.openvideoplayer.net.OvpConnection;
	import org.openvideoplayer.net.OvpNetStream;

	import flash.events.AsyncErrorEvent;
	import flash.events.NetStatusEvent;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class OvpVideoStream extends VideoStream implements IStream 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _ovpConnection:OvpConnection;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function OvpVideoStream(id:String, src:String, loop:int = 1, minBuffer:Number = 0)
		{
			super(id, src, loop, minBuffer);
		}
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		override protected function createStream():void
		{
			_ovpConnection = new OvpConnection();
			_ovpConnection.addEventListener(OvpEvent.ERROR, ovpErrorHandler);
			_ovpConnection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			_ovpConnection.connect(null);
			
			_connection = _ovpConnection.netConnection;
			_connection.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			_connection.connect(null);
			
			_client = new NetStreamClient;
			_client.addEventListener(NetStreamClientEvent.META_DATA_LOADED, metaDataHandler);
			
			stream = new OvpNetStream(_connection);
			stream.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			stream.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asyncErrorHandler);
			stream.addEventListener(OvpEvent.PROGRESS, onNetStreamProgress);
			stream.addEventListener(OvpEvent.ERROR, ovpErrorHandler);
			stream.client = _client;
		}
		override protected function getStream():void
		{
			//need to be tested!!!
			_client = Library.instance.getItem(id + "/netStreamClient") as NetStreamClient;
			stream = Library.instance.getItem(id) as OvpNetStream;
		}
		
		
		/*
		 * 
		 * HANDLERS
		 * 
		 */
		protected function ovpErrorHandler(e:OvpEvent):void
		{
			Console.output(this, "ovpErrorHandler: " + e.type);
		}
		private function onNetStreamProgress(event:OvpEvent):void
		{
//			var ovpNetStream:OvpNetStream = (event.target as ovpNetStream);
//			
//			if(ovpNetStream.bytesLoaded >= ovpNetStream.bytesTotal)
//			{
//				
//			}
		}
	}
}