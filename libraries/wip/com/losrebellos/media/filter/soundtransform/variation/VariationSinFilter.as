package com.losrebellos.media.filter.soundtransform.variation
{

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class VariationSinFilter extends BaseVariationFilter
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private const PI:Number		= Math.PI;
		private const PI_2:Number	= PI * 2;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		// default to pan left to right
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function VariationSinFilter(param:String = "pan", minimum:Number = -1, maximum:Number = 1, speed:Number = .05, startDirection:int = 1)
		{
			super(param, minimum, maximum, speed, startDirection);
			
			calculateDeltas();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROPERTIES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _maxPlusMin:Number;
		private var _maxMinusMin:Number;
		private function calculateDeltas():void
		{
			_maxPlusMin = _maximum + _minimum;
			_maxMinusMin = _maximum - _minimum;
		}
		override public function set minimum(value:Number):void
		{
			super.minimum = value;
			
			calculateDeltas();
		}
		override public function set maximum(value:Number):void
		{
			super.maximum = value;
			
			calculateDeltas();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROCESS
		// _angle start on 0
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _angle:Number = PI / 2;
		override public function process():void
		{
			_soundTransform[_param] = (_maxPlusMin + Math.sin((_angle += _direction * _speed) * PI_2) * _maxMinusMin) / 2;
		}
	}
}