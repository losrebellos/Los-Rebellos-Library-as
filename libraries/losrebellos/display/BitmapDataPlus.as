package losrebellos.display 
{
	import losrebellos.utils.DictionaryPlus;

	import flash.display.BitmapData;
	import flash.geom.Matrix;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BitmapDataPlus extends BitmapData 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function BitmapDataPlus(width:int, height:int, transparent:Boolean = true, fillColor:uint = 4.294967295E9)
		{
			super(width, height, transparent, fillColor);
		}

		
		/*
		 * 
		 * INDEX THE COLOURS
		 * 
		 */
		public static function indexColours(bmpd:BitmapData):Array
		{
			var n:DictionaryPlus = new DictionaryPlus(true);
			var p:int;
			
			//get all the colours
			for (var x:int = 0; x<bmpd.width; x++)
			{
				for (var y:int = 0; y<bmpd.height; y++)
				{
					p = bmpd.getPixel(x, y);
					
					if(n[p])
					{
						n[p]++;
					}
					else
					{
						n[p] = 1;
					}
				}
			}
			
			//get all the colours into a tab
			var a:Array = [];
			for(var c:String in n)
			{
				a.push({colour:c, count:n[c]});
			}
			
			//method to sort the tab
			function byCount(a:Object,b:Object ):int
			{
				if(a["count"] > b["count"])
				{
					return 1;
				}
				
				if(a["count"] < b["count"])
				{
					return -1;
				}
				
				return 0;
			}
		
			return a.sort(byCount, Array.DESCENDING);
		}
		
		
		/*
		 * 
		 * ROTATIONS
		 * 
		 */
		public function rotate90CCW():void
		{
			var matrix:Matrix = new Matrix();
			matrix.rotate(-1 * Math.PI / 2);
			matrix.ty = this.width;
			
			this = cloneWithMatrix(this.height, this.width, matrix);
		}
		public function rotate90CW():void
		{
			var matrix:Matrix = new Matrix();
			matrix.rotate(Math.PI / 2);
			matrix.ty = this.height;
			
			this = cloneWithMatrix(this.height, this.width, matrix);
		}
		public function rotate180():void
		{
			var matrix:Matrix = new Matrix();
			matrix.rotate(Math.PI);
			
			this = cloneWithMatrix(this.width, this.height, matrix);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function cloneWithMatrix(width:int, height:int, matrix:Matrix):BitmapDataPlus
		{
			var bmpd:BitmapDataPlus = new BitmapDataPlus(width, height);
			bmpd.draw(this, matrix);
			
			return bmpd;
		}
		
		
		/*
		 * 
		 * FLIPPING
		 * 
		 */
		public function flipHorizontal():void
		{
			var matrix:Matrix = new Matrix();
			matrix.scale(1, -1);
			matrix.translate(0, this.height);
			
			this.draw(this, matrix);
		}
		public function flipVertical():void
		{
			var matrix:Matrix = new Matrix();
			matrix.scale(-1, 1);
			matrix.translate(this.width, 0);
			
			this.draw(this, matrix);
		}
	}
}