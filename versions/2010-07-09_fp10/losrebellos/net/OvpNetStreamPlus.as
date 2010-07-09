package losrebellos.net 
{
	import org.openvideoplayer.net.OvpNetStream;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class OvpNetStreamPlus extends OvpNetStream 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function OvpNetStreamPlus(connection:Object)
		{
			super(connection);
		}
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
	}
}
