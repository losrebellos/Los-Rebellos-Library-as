package losrebellos.net 
{
	import flash.net.NetConnection;
	import flash.net.NetStream;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class NetStreamPlus extends NetStream implements INetStreamPlus
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function NetStreamPlus(connection:NetConnection, peerID:String = "connectToFMS")
		{
			super(connection, peerID);
		}
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			this.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
	}
}