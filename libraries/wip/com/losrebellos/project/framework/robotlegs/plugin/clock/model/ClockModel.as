package com.losrebellos.project.framework.robotlegs.plugin.clock.model
{
	import com.losrebellos.project.framework.robotlegs.plugin.clock.events.ClockEvent;
	import com.losrebellos.project.framework.robotlegs.plugin.clock.interfaces.IClockable;

	import org.robotlegs.mvcs.Actor;

	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.IEventDispatcher;



	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class ClockModel extends Actor implements IClockModel
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function ClockModel()
		{
			super();
			
			if(!_instance)
			{
				_instance = this;
			}
			
			_clockables = new Vector.<IClockable>(0, true);
			_methods = new Vector.<Function>(0, true);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STATIC
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static var _instance:IClockModel;
		public static function get instance():IClockModel
		{
			return _instance || new ClockModel();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CLOCK
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private const CLOCK:Shape = new Shape();
		private function checkClock():void
		{
			if(_methods.length == 0 && _clockables.length == 0)
			{
				CLOCK.removeEventListener(Event.ENTER_FRAME, onClock);
			}
			else if(!CLOCK.hasEventListener(Event.ENTER_FRAME))
			{
				CLOCK.addEventListener(Event.ENTER_FRAME, onClock);
			}
		}
		private var _clockable:IClockable;
		private var _method:Function;
		private function onClock(e:Event):void
		{
			// had to use slower loop style
			// because throws error if an item is removed
			
			for each(_clockable in _clockables)
			{
				_clockable.update();
			}
			
			for each(_method in _methods)
			{
				_method();
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// ICLOCKABLE / METHOD
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _clockables:Vector.<IClockable>;
		private var _methods:Vector.<Function>;
		public function add(clockableOrMethod:*, execute:Boolean = false):void
		{
			if(clockableOrMethod is IClockable)
			{
				if(_clockables.indexOf(clockableOrMethod) == -1)
				{
					_clockables.fixed = false;
					_clockables.push(clockableOrMethod);
					_clockables.fixed = true;
				}
				
				if(execute)
				{
					IClockable(clockableOrMethod).update();
				}
			}
			else
			{
				if(_methods.indexOf(clockableOrMethod) == -1)
				{
					_methods.fixed = false;
					_methods.push(clockableOrMethod);
					_methods.fixed = true;
				}
				
				if(execute)
				{
					clockableOrMethod();
				}
			}
			
			checkClock();
		}
		public function has(clockableOrMethod:*):Boolean
		{
			return (_clockables.indexOf(clockableOrMethod) >= 0 || _methods.indexOf(clockableOrMethod) >= 0);
		}
		public function remove(clockableOrMethod:*, execute:Boolean = false):Boolean
		{
			var index:int;
			if(clockableOrMethod is IClockable)
			{
				index = _clockables.indexOf(clockableOrMethod);
				if(index == -1)
				{
					return false;
				}
				
				_clockables.fixed = false;
				_clockables.splice(index, 1);
				_clockables.fixed = true;
				
				if(execute)
				{
					IClockable(clockableOrMethod).update();
				}
			}
			else
			{
				index = _methods.indexOf(clockableOrMethod);
				if(index == -1)
				{
					return false;
				}
				
				_methods.fixed = false;
				_methods.splice(index, 1);
				_methods.fixed = true;
				
				if(execute)
				{
					clockableOrMethod();
				}
			}
			
			checkClock();
			
			return true;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LENGTH / EMPTY
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get length():int
		{
			return _clockables.length + _methods.length;
		}
		public function empty():void
		{
			var clockable:IClockable;
			for each(clockable in _clockables)
			{
				clockable = null;
			}
			_clockables = null;
			_clockables = new Vector.<IClockable>(0, true);
			
			var method:Function;
			for each(method in _methods)
			{
				method = null;
			}
			_methods = null;
			_methods = new Vector.<Function>(0, true);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// HELPERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function addListeners(dispatcher:IEventDispatcher):void
		{
			dispatcher.addEventListener(ClockEvent.ADD, onAdd, false, 0, true);
			dispatcher.addEventListener(ClockEvent.REMOVE, onRemove, false, 0, true);
			dispatcher.addEventListener(ClockEvent.EMPTY, onEmpty, false, 0, true);
		}
		public function removeListeners(dispatcher:IEventDispatcher):void
		{
			dispatcher.removeEventListener(ClockEvent.ADD, onAdd);
			dispatcher.removeEventListener(ClockEvent.REMOVE, onRemove);
			dispatcher.removeEventListener(ClockEvent.EMPTY, onEmpty);
		}
		// handlers
		private function onAdd(e:ClockEvent):void
		{
			add(e.clockableOrMethod);
		}
		private function onRemove(e:ClockEvent):void
		{
			remove(e.clockableOrMethod);
		}
		private function onEmpty(e:ClockEvent):void
		{
			empty();
		}
	}
}