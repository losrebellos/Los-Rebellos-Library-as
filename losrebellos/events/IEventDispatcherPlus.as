package losrebellos.events 
{
	import flash.events.IEventDispatcher;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IEventDispatcherPlus extends IEventDispatcher
	{
		function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void;
	}
}