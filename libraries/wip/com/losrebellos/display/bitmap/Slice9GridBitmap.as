package com.losrebellos.display.bitmap 
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;


	/**
	 * 
	 * @author Shane McCartney - http://www.lostinactionscript.com
	 * optimized by Ian McGregor - http://www.alwaysinbeta.org
	 * re-optimized by Benoit Vinay - http://www.benoitvinay.com
	 * 
	 */
	public class Slice9GridBitmap extends BitmapPlus implements ISlice9GridBitmap
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static const POINT_ZERO:Point	= new Point();
		private static const SLICES:int			= 9;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function Slice9GridBitmap(bitmapData:BitmapData, slice9Grid:Rectangle, pixelSnapping:String = "auto", smoothing:Boolean = false)
		{
			_sourceBitmapData = bitmapData;
			_slices = new Vector.<BitmapData>(SLICES, true);
			
			super(null, pixelSnapping, smoothing);
			
			_slice9Grid = slice9Grid;
			_renderWidth = bitmapData.width;
			_renderHeight = bitmapData.height;
			
			slice9GridUpdate();
			renderSlice9Grid();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// BITMAP DATA
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set sourceBitmapData(value:BitmapData):void
		{
			_sourceBitmapData = value;
			_slices = new Vector.<BitmapData>(SLICES, true);
			_renderWidth = _sourceBitmapData.width;
			_renderHeight = _sourceBitmapData.height;
			
			slice9GridUpdate();
			renderSlice9Grid();
		}
		public function get sourceBitmapData():BitmapData
		{
			return _sourceBitmapData;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SLICE RECTANGLE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _slice9Grid:Rectangle;
		public function set slice9Grid(value:Rectangle):void
		{
			_slice9Grid = value;
			_slices = new Vector.<BitmapData>(SLICES, true);
			
			slice9GridUpdate();
			renderSlice9Grid();
		}
		public function get slice9Grid():Rectangle
		{
			return _slice9Grid;
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// WIDTH & HEIGHT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _renderWidth:int;
		override public function set width(value:Number):void
		{
			_renderWidth = value;
			
			renderSlice9Grid();
		}
		override public function get width():Number 
		{
			return _renderWidth;
		}
		private var _renderHeight:int;
		override public function set height(value:Number):void 
		{
			_renderHeight = value;
			
			renderSlice9Grid();
		}
		override public function get height():Number 
		{
			return _renderHeight;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// UPDATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _sourceBitmapData:BitmapData;
		private var _slices:Vector.<BitmapData>;
		private function slice9GridUpdate():void 
		{
			var slice1X:Number = 0;			var slice2X:Number = _slice9Grid.x;
			var slice3X:Number = _slice9Grid.x + _slice9Grid.width;
			
			var slice1Y:Number = 0;			var slice2Y:Number = _slice9Grid.y;			var slice3Y:Number = _slice9Grid.y + _slice9Grid.height;
			
			var slice1Width:Number = _slice9Grid.x;			var slice2Width:Number = _slice9Grid.width;			var slice3Width:Number = _sourceBitmapData.width - _slice9Grid.width - _slice9Grid.x;
			
			var slice1Height:Number = _slice9Grid.y;
			var slice2Height:Number = _slice9Grid.height;
			var slice3Height:Number = _sourceBitmapData.height - _slice9Grid.height - _slice9Grid.y;
			
			// top row
			_slices[0] = getSliceBitmapData(new Rectangle(slice1X, slice1Y, slice1Width, slice1Height));			_slices[1] = getSliceBitmapData(new Rectangle(slice2X, slice1Y, slice2Width, slice1Height));
			_slices[2] = getSliceBitmapData(new Rectangle(slice3X, slice1Y, slice3Width, slice1Height));
			
			// middle row
			_slices[3] = getSliceBitmapData(new Rectangle(slice1X, slice2Y, slice1Width, slice2Height));
			_slices[4] = getSliceBitmapData(new Rectangle(slice2X, slice2Y, slice2Width, slice2Height));
			_slices[5] = getSliceBitmapData(new Rectangle(slice3X, slice2Y, slice3Width, slice2Height));
			
			// bottom row
			_slices[6] = getSliceBitmapData(new Rectangle(slice1X, slice3Y, slice1Width, slice3Height));
			_slices[7] = getSliceBitmapData(new Rectangle(slice2X, slice3Y, slice2Width, slice3Height));
			_slices[8] = getSliceBitmapData(new Rectangle(slice3X, slice3Y, slice3Width, slice3Height));
		}
		private function getSliceBitmapData(sourceRect:Rectangle):BitmapData 
		{
			var sliceBitmapData:BitmapData = new BitmapData(int(sourceRect.width), int(sourceRect.height), true, 0x00FFFFFF);
			sliceBitmapData.copyPixels(_sourceBitmapData, sourceRect, POINT_ZERO);
			
			return sliceBitmapData;
		}
		private function renderSlice9Grid():void 
		{
			bitmapData = new BitmapData(_renderWidth, _renderHeight, true, 0x00FF0000);
			
			var destPoint:Point = new Point();
			var column:int = 0;
			var row:int = 0;
			var sliceBitmapData:BitmapData;
			var sliceBounds:Rectangle = new Rectangle();
			
			var slicesCounter:int = 0;
			for(slicesCounter = 0; slicesCounter<SLICES; slicesCounter++) 
			{
				column = slicesCounter % 3;
				row = int(slicesCounter / 3);
				
				sliceBitmapData = _slices[slicesCounter];
				
				sliceBounds.width = sliceBitmapData.width;
				sliceBounds.height = sliceBitmapData.height;
				
				if((column == 0 || column == 2) && (row == 0 || row == 2)) 
				{
					bitmapData.copyPixels(sliceBitmapData, sliceBitmapData.rect, destPoint);
				} 
				else 
				{
					if(column == 1) 
					{
						sliceBounds.width = _renderWidth - _slice9Grid.x - (_sourceBitmapData.width - _slice9Grid.width - _slice9Grid.x);
						sliceBounds.width = Math.max(0, sliceBounds.width);
					}
					
					if(row == 1) 
					{
						sliceBounds.height = _renderHeight - _slice9Grid.y - (_sourceBitmapData.height - _slice9Grid.height - _slice9Grid.y);
						sliceBounds.height = Math.max(0, sliceBounds.height);
					}
					
					var transMatrix:Matrix = new Matrix();
					transMatrix.scale(sliceBounds.width / sliceBitmapData.width, sliceBounds.height / sliceBitmapData.height);
					transMatrix.translate(destPoint.x, destPoint.y);
					
					bitmapData.draw(sliceBitmapData, transMatrix);
				}
				
				if(column == 2)
				{
					destPoint.x = 0;
					destPoint.y += sliceBounds.height;
				}
				else
				{
					destPoint.x += sliceBounds.width;
				}
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose(e:Event = null):void
		{
			super.dispose(e);
			
			var bmpd:BitmapData;
			for each(bmpd in _slices)
			{
				bmpd.dispose();
				bmpd = null;
			}
			
			_slices = null;
			
			_sourceBitmapData.dispose();
			_sourceBitmapData = null;
			
			_slice9Grid = null;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INVALIDATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function resize(rect:Rectangle):void
		{
			super.resize(rect);
			
			if(_rect.width != _renderWidth || _rect.height != _renderHeight)
			{
				_renderWidth = _rect.width;
				_renderHeight = _rect.height;
			
				renderSlice9Grid();
			}
		}
	}
}