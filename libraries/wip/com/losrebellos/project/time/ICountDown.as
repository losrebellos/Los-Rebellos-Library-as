package com.losrebellos.project.time
{
	import com.losrebellos.events.IEventDispatcherPlus;
	import com.losrebellos.interfaces.IDisposable;
	import com.losrebellos.interfaces.IInteractive;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public interface ICountDown extends IInteractive, IEventDispatcherPlus, IDisposable
	{
		
	}
}