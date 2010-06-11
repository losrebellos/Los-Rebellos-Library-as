package losrebellos.lospistoleros.core.dispatcher 
{

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
		
		function get element():*;
	}
}