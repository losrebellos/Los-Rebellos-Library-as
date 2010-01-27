package losrebellos.interfaces 
{

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public interface IEvent 
	{
		function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void;
	}
}