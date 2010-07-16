package losrebellos.geom 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class Circle extends Object 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		public var radius:Number;
		public var y:Number;
		public var x:Number;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function Circle(x:Number = 0, y:Number = 0, radius:Number = 0)
		{
			this.x = x;
			this.y = y;
			this.radius = radius;
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function clone():Circle
		{
			return new Circle(x, y, radius);
		}
		public function toString():String
		{
			return "Circle: (x: " + x + ", y: " + y + "), radius: " + radius;
		}
	}
}