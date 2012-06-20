package com.losrebellos.project.time
{
	import com.losrebellos.interfaces.IDisposable;

	import flash.events.IEventDispatcher;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public interface IServerTime extends IEventDispatcher, IDisposable
	{
		function load(url:String):void;
	}
}