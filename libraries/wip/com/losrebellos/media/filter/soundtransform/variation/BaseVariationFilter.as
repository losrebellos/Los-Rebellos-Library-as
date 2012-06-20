package com.losrebellos.media.filter.soundtransform.variation
{
	import com.losrebellos.media.filter.soundtransform.ISoundTransformFilter;
	import flash.media.SoundTransform;


	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class BaseVariationFilter implements ISoundTransformFilter
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		// param is the property we're changing
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BaseVariationFilter(param:String, minimum:Number = -1, maximum:Number = 1, speed:Number = .05, startDirection:int = 1)
		{
			_param = param;
			_minimum = minimum;
			_maximum = maximum;
			_speed = speed;
			
			// just to be sure to have either -1 or 1
			_direction = startDirection / Math.abs(startDirection);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SOUND TRANSFORM
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _soundTransform:SoundTransform;
		public function set soundTransform(value:SoundTransform):void
		{
			_soundTransform = value;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROPERTIES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _minimum:Number;
		public function set minimum(value:Number):void
		{
			_minimum = value;
		}
		public function get minimum():Number
		{
			return _minimum;
		}
		protected var _maximum:Number;
		public function set maximum(value:Number):void
		{
			_maximum = value;
		}
		public function get maximum():Number
		{
			return _maximum;
		}
		protected var _speed:Number;
		public function set speed(value:Number):void
		{
			_speed = value;
		}
		public function get speed():Number
		{
			return _speed;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROCESS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _param:String;
		protected var _direction:int;
		public function process():void
		{
			
		}
	}
}