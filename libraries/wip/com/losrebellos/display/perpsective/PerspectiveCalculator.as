package com.losrebellos.display.perpsective
{
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class PerspectiveCalculator implements IPerspective
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private const DEFAULT_POINTS:Rectangle		= new Rectangle(0, 0, 100, 100);
		private const DEFAULT_POINT_1:Point			= new Point(DEFAULT_POINTS.x, DEFAULT_POINTS.y);
		private const DEFAULT_POINT_2:Point			= new Point(DEFAULT_POINTS.width, DEFAULT_POINTS.y);
		private const DEFAULT_POINT_3:Point			= new Point(DEFAULT_POINTS.width, DEFAULT_POINTS.height);
		private const DEFAULT_POINT_4:Point			= new Point(DEFAULT_POINTS.x, DEFAULT_POINTS.height);
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function PerspectiveCalculator(graphics:Graphics, source:BitmapData = null, p1:Point = null, p2:Point = null, p3:Point = null, p4:Point = null)
		{
			_graphics = graphics;
			_source = source;
			
			update(p1 || DEFAULT_POINT_1, p2 || DEFAULT_POINT_2, p3 || DEFAULT_POINT_3, p4 || DEFAULT_POINT_4);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// GRAPHICS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _graphics:Graphics;
		public function set graphics(value:Graphics):void
		{
			_graphics = value;
		}
		public function get graphics():Graphics
		{
			return _graphics;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SOURCE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _source:BitmapData;
		public function set source(value:BitmapData):void
		{
			_source = value;
		}
		public function get source():BitmapData
		{
			return _source;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// UPDATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _ll1:Number;
		private var _ll2:Number;
		private var _lr1:Number;
		private var _lr2:Number;
		private var _f:Number;
		public function update(p1:Point, p2:Point, p3:Point, p4:Point):Point
		{
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// based on http://zehfernando.com/2010/the-best-drawplane-distortimage-method-ever/
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 		
			// source & graphics shouldn't be null
			if(!_graphics || !_source)
			{
				throw new IllegalOperationError("PerspectiveCalculator.update: graphics and source shouldn't be null");
			}
			
			// Central point
			// If no intersection between two diagonals, doesn't draw anything
			if(!calculateCentralPoint(p1, p4, p2, p3))
			{
				return null;
			}

			// Lengths of first diagonal
			_ll1 = Point.distance(p1, _centralPoint);
			_ll2 = Point.distance(_centralPoint, p4);

			// Lengths of second diagonal
			_lr1 = Point.distance(p2, _centralPoint);
			_lr2 = Point.distance(_centralPoint, p3);

			// Ratio between diagonals
			_f = (_ll1 + _ll2) / (_lr1 + _lr2);

			// Draws the triangle
			_graphics.clear();
			_graphics.beginBitmapFill(_source, null, false, true);
			_graphics.drawTriangles(
									Vector.<Number>([p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y]),
									Vector.<int>([0, 1, 2, 1, 3, 2]),
									Vector.<Number>([0, 0, (1 / _ll2) * _f, 1, 0, (1 / _lr2), 0, 1, (1 / _lr1), 1, 1, (1 / _ll1) * _f])
								);
			_graphics.endFill();
			
			// intersection
			return _centralPoint;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INTERSECTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _centralPoint:Point;
		public function get centralPoint():Point
		{
			return _centralPoint;
		}
		private function calculateCentralPoint(p1:Point, p2:Point, p3:Point, p4:Point):Point
		{
			// Returns a point containing the intersection between two lines
			// http://keith-hair.net/blog/2008/08/04/find-intersection-point-of-two-lines-in-as3/
			// http://www.gamedev.pastebin.com/f49a054c1

			var a1:Number = p2.y - p1.y;
			var b1:Number = p1.x - p2.x;
			var a2:Number = p4.y - p3.y;
			var b2:Number = p3.x - p4.x;

			var denom:Number = a1 * b2 - a2 * b1;
			if(denom == 0)
			{
				return null;
			}

			var c1:Number = p2.x * p1.y - p1.x * p2.y;
			var c2:Number = p4.x * p3.y - p3.x * p4.y;

			_centralPoint = new Point((b1 * c2 - b2 * c1) / denom, (a2 * c1 - a1 * c2) / denom);
			if(Point.distance(_centralPoint, p2) > Point.distance(p1, p2))
			{
				return _centralPoint = null;
			}
			if(Point.distance(_centralPoint, p1) > Point.distance(p1, p2))
			{
				return _centralPoint = null;
			}
			if(Point.distance(_centralPoint, p4) > Point.distance(p3, p4))
			{
				return _centralPoint = null;
			}
			if(Point.distance(_centralPoint, p3) > Point.distance(p3, p4))
			{
				return _centralPoint = null;
			}

			return _centralPoint;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose(e:Event = null):void
		{
			if(_graphics)
			{
				_graphics.clear();
				_graphics = null;
			}
			
			if(_source)
			{
				_source.dispose();
				_source = null;
			}
		}
	}
}