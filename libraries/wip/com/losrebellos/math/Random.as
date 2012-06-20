package com.losrebellos.math {
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class Random
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// XOR: UINT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// returns a number from 0 - 1
		private static const MAX_RATIO_UINT:Number		= 1 / uint.MAX_VALUE;
		private static var _rUint:uint					= Math.random() * uint.MAX_VALUE;
		public static function randomInt():Number
		{
			_rUint ^= (_rUint << 21);
			_rUint ^= (_rUint >>> 35);
			_rUint ^= (_rUint << 4);
			
			return _rUint * MAX_RATIO_UINT;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// XOR: INT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//  comment out line 13 for -1 - 1
		private static const MAX_RATIO_INT:Number		= 1 / int.MAX_VALUE;
		private static const NEGA_MAX_RATIO:Number		= -MAX_RATIO_INT;
		private static var _rInt:int					= Math.random() * int.MAX_VALUE;
		public static function randomUint():Number
		{
			_rInt ^= (_rInt << 21);
			_rInt ^= (_rInt >>> 35);
			_rInt ^= (_rInt << 4);
			
			return _rInt * NEGA_MAX_RATIO;
		}
	}
}