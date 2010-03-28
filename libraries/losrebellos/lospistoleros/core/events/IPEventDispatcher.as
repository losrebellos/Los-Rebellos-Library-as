package losrebellos.lospistoleros.core.events 
{
	import losrebellos.events.IEventDispatcherPlus;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPEventDispatcher extends IEventDispatcherPlus 
	{
		function set NAME(value:String):void;
		function get NAME():String;
	}
}