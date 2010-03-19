package losrebellos.display 
{
	import losrebellos.interfaces.IEvent;

	import flash.display.Loader;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class LoaderPlus extends Loader implements IEvent 
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function LoaderPlus()
		{
			super();
		}
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			useWeakReference;
			
			super.addEventListener(type, listener, useCapture, priority, true);
		}
	}
}