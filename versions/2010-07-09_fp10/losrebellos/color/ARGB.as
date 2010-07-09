package losrebellos.color 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class ARGB extends RGB 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		private var _alpha:Number = 1;
		public function set alpha(value:Number):void
		{
			_alpha = value;
		}
		public function get alpha():Number
		{
			return _alpha;
		}
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function ARGB(red:Number = 1, green:Number = 1, blue:Number = 1, alpha:Number = 1)
		{
			super(red, green, blue);
			
			_alpha = alpha;
		}
		override public function parse(color:uint):void
		{
			super.parse(color);
			
			_alpha = (color >> 24 & 0xFF) / 255;
		}
	}
}