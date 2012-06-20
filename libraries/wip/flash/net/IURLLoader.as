package flash.net 
{
	import flash.events.IEventDispatcher;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IURLLoader extends IEventDispatcher
	{
		function close():void;
		
		function load(request:URLRequest):void;
	}
}