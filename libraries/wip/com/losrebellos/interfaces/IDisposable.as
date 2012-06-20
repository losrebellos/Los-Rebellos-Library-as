package com.losrebellos.interfaces
{
	import flash.events.Event;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IDisposable
	{
		function dispose(e:Event = null):void;
	}
}