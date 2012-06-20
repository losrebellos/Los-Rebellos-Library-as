package com.losrebellos.display.bitmapdata 
{
	import com.losrebellos.utils.collection.DictionaryPlus;
	import flash.display.BitmapData;
	import flash.geom.Matrix;



	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BitmapDataPlus extends BitmapData implements IBitmapDataPlus
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BitmapDataPlus(width:int, height:int, transparent:Boolean = true, fillColor:uint = 4.294967295E9)
		{
			super(width, height, transparent, fillColor);
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INDEX THE COLOURS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function indexColours():Vector.<Object>
		{
			return BitmapDataPlus.indexColours(this);
		}
		public static function indexColours(bmpd:BitmapData):Vector.<Object>
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
			var a:Vector.<Object> = new Vector.<Object>();
			for(var c:String in n)
			{
				a.push({colour:c, count:n[c]});
			}
			a.fixed = true;
		
//			return a.sort(sortByCount, Array.DESCENDING);
			return a.sort(sortByCount);
		}
		//method to sort the tab
		private static function sortByCount(a:Object,b:Object ):int
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
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// ROTATIONS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function rotate90CCW():BitmapDataPlus
		{
			var matrix:Matrix = new Matrix();
			matrix.rotate(-1 * Math.PI / 2);
			matrix.ty = this.width;
			
			return cloneWithMatrix(this.height, this.width, matrix);
		}
		public function rotate90CW():BitmapDataPlus
		{
			var matrix:Matrix = new Matrix();
			matrix.rotate(Math.PI / 2);
			matrix.ty = this.height;
			
			return cloneWithMatrix(this.height, this.width, matrix);
		}
		public function rotate180():BitmapDataPlus
		{
			var matrix:Matrix = new Matrix();
			matrix.rotate(Math.PI);
			
			return cloneWithMatrix(this.width, this.height, matrix);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CLONE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function cloneWithMatrix(width:int, height:int, matrix:Matrix):BitmapDataPlus
		{
			var bmpd:BitmapDataPlus = new BitmapDataPlus(width, height, this.transparent, 0x00FFFFFF);
			bmpd.draw(this, matrix);
			
			return bmpd;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// FLIPPING
		// horizontal
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function flipHorizontal():BitmapDataPlus
		{
			var matrix:Matrix = new Matrix();
			matrix.scale(1, -1);
			matrix.translate(0, this.height);
			
			var flipBmpd:BitmapDataPlus = new BitmapDataPlus(this.width, this.height, this.transparent, 0x00FFFFFF);
			flipBmpd.draw(this, matrix);
			
			return flipBmpd;
		}
		public static function flipHorizontal(bitmapData:BitmapData):BitmapDataPlus
		{
			var matrix:Matrix = new Matrix();
			matrix.scale(1, -1);
			matrix.translate(0, bitmapData.height);
			
			var flipBmpd:BitmapDataPlus = new BitmapDataPlus(bitmapData.width, bitmapData.height, bitmapData.transparent, 0x00FFFFFF);
			flipBmpd.draw(bitmapData, matrix);
			
			return flipBmpd;
		}
		// vertical
		public function flipVertical():BitmapDataPlus
		{
			var matrix:Matrix = new Matrix();
			matrix.scale(-1, 1);
			matrix.translate(this.width, 0);
			
			var flipBmpd:BitmapDataPlus = new BitmapDataPlus(this.width, this.height, this.transparent, 0x00FFFFFF);
			flipBmpd.draw(this, matrix);
			
			return flipBmpd;
		}
		public static function flipVertical(bitmapData:BitmapData):BitmapDataPlus
		{
			var matrix:Matrix = new Matrix();
			matrix.scale(-1, 1);
			matrix.translate(bitmapData.width, 0);
			
			var flipBmpd:BitmapDataPlus = new BitmapDataPlus(bitmapData.width, bitmapData.height, bitmapData.transparent, 0x00FFFFFF);
			flipBmpd.draw(bitmapData, matrix);
			
			return flipBmpd;
		}
	}
}