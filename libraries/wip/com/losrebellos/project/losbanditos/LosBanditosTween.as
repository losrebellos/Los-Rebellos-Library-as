package com.losrebellos.project.losbanditos
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class LosBanditosTween 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static const PROPERTIES_METHODS:Array	= [
															"onStart",
															"onStartParams",
															"onUpdate",
															"onUpdateParams",
															"onComplete",
															"onCompleteParams"
														];
		private static const PROPERTIES_SPECIFIC:Array	= ["delay"];
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		// calculation
		// t: current time, b: beginning value, c: change in value, d: duration
		// t and d can be frames or seconds/milliseconds
		// here:
		//		b == _starts
		//		c == _changes
		private var _object:Object;
		private var _props:Vector.<String>;
		private var _propsLength:int;
		private var _starts:Vector.<Number>;
		private var _changes:Vector.<Number>;
		private var _ease:Function;
		
		// timing
		private var _addedTime:int;
		private var _delay:int;
		public var startTime:int;
		public var duration:int;
		public var endTime:int;
		
		// properties
		public var onStart:Function = null;
		public var onStartParams:Array = [];
		public var onUpdate:Function = null;
		public var onUpdateParams:Array = [];
		public var onComplete:Function = null;
		public var onCompleteParams:Array = [];
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function LosBanditosTween(object:Object, addedTime:int, duration:int, delay:int, properties:Object, ease:Function = null)
		{
			// object & ease
			_object = object;
			_ease = (ease == null) ? LosBanditosDefaultEase.quadEaseOut : ease;
			
			// positions
			_props = new Vector.<String>();
			_starts = new Vector.<Number>();
			_changes = new Vector.<Number>();
			for(var property:String in properties)
			{
				if(PROPERTIES_SPECIFIC.indexOf(property) == -1 && PROPERTIES_METHODS.indexOf(property) == -1)
				{
					_props.push(property);
					_starts.push(object[property]);
					_changes.push(properties[property] - object[property]);
				}
				else if(PROPERTIES_SPECIFIC.indexOf(property) == -1)
				{
					this[property] = properties[property];
				}
			}
			_props.fixed = _starts.fixed = _changes.fixed = true;
			_propsLength = _props.length;
			
			// timing
			_delay = delay;
			_addedTime = addedTime;
			this.duration = duration;
			this.startTime = _delay + addedTime;
			this.endTime = addedTime + _delay + duration;
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// UPDATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _i:int;
		internal function update(t:int):void
		{
			_i = _propsLength;
			while(--_i>-1)
			{
//				_object[_props[_i]] = _ease.call(_object, t, _starts[_i], _changes[_i], duration);
				_object[_props[_i]] = _ease(_object, t, _starts[_i], _changes[_i], duration);
			}
		}
	}
}