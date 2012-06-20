package com.losrebellos.media.filter.soundtransform.variation
{

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class VariationLinearFilter extends BaseVariationFilter
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		// default to pan left to right
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function VariationLinearFilter(param:String = "pan", minimum:Number = -1, maximum:Number = 1, speed:Number = .05, startDirection:int = 1)
		{
			super(param, minimum, maximum, speed, startDirection);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROCESS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function process():void
		{
			if(_soundTransform[_param] + _speed < _minimum || _soundTransform[_param] + _speed > _maximum)
			{
				_direction *= -1;
			}
			
			_soundTransform[_param] += _speed * _direction;
		}
	}
}