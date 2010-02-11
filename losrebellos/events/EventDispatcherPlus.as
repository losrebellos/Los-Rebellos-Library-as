package losrebellos.events 
{
	import losrebellos.interfaces.IEvent;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class EventDispatcherPlus extends EventDispatcher implements IEvent
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function EventDispatcherPlus(target:IEventDispatcher = null)
		{
			super(target);
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