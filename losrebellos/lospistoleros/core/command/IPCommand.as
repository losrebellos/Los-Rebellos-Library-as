package losrebellos.lospistoleros.core.command {	import flash.events.IEventDispatcher;	/*	 *	 * @author los rebellos	 *	 */	public interface IPCommand extends IEventDispatcher	{		function execute():Boolean;	}}