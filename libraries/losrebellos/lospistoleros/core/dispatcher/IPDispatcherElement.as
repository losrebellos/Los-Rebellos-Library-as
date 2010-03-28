package losrebellos.lospistoleros.core.dispatcher 
{
	import losrebellos.lospistoleros.core.events.IPEventDispatcher;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPDispatcherElement 
	{
		function get type():String;
		function get constructor():Object;
		function get name():String;
		
		function get element():IPEventDispatcher;
	}
}