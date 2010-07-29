package losrebellos.geom 
{
	import flash.geom.Matrix;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class GradientBox extends Matrix 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function GradientBox(width:Number, height:Number, rotation:Number = 0, tx:Number = 0, ty:Number = 0)
		{
			super();
			
			this.createGradientBox(width, height, rotation, tx, ty);
		}
	}
}