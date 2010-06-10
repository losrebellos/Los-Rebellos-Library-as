package losrebellos.display 
{
	import losrebellos.interfaces.IGraphics;

	import flash.display.Graphics;
	import flash.display.Shape;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class ShapePlus extends Shape implements IGraphics
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function ShapePlus()
		{
			super();
			
			_graphics = this.graphics;
		}
		
		
		/*
		 * 
		 * GRAPHICS
		 * 
		 */
		protected var _graphics:Graphics;
		public function get g():Graphics
		{
			return _graphics;
		}
	}
}