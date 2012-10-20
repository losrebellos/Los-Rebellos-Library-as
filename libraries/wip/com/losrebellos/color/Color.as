package com.losrebellos.color {
	import flash.geom.ColorTransform;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class Color extends ColorTransform
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static const	BLACK:int		= 0x000000;
		public static const	BLUE:int		= 0x0000FF;
		public static const	CYAN:int		= 0x00FFFF;
		public static const	GREEN:int		= 0x00FF00;
		public static const	PURPLE:int		= 0xFF00FF;
		public static const	RED:int			= 0xFF0000;
		public static const	WHITE:int		= 0xFFFFFF;
		public static const	YELLOW:int		= 0xFFFF00;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function Color(color:uint)
		{
			super();
			
			this.color = color;
		}
	}
}