package com.losrebellos.project.framework.robotlegs.plugin
{
	import org.robotlegs.core.ICommandMap;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IMediatorMap;

	import flash.display.DisplayObjectContainer;
	import flash.errors.IllegalOperationError;
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class RobotlegsPlugin implements IRobotlegsPlugin
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:ICommandMap;
		
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		[Inject]
		public var contextView:DisplayObjectContainer;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CLASS NAME
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get qualifiedClassName():String
		{
			return getQualifiedClassName(this);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INIT
		//
		// args if you need to pass parameters
		// (fire some Commands at the end so you can chain plugin for instance)
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function init():void
		{
			throw new IllegalOperationError(getQualifiedClassName + ".init => must be overridden");
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DEBUG
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set debug(value:Boolean):void
		{
			throw new IllegalOperationError(getQualifiedClassName + ".debug => must be overridden");
		}


		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose():void
		{
			throw new IllegalOperationError(getQualifiedClassName + ".dispose => must be overridden");
		}
	}
}