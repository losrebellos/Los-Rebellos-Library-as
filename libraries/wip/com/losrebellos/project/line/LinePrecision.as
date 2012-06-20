package com.losrebellos.project.line
{
	import flash.geom.Point;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class LinePrecision implements ILinePrecision
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _firstPoint:Point;
		private var _lastPoint:Point;
		

		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function LinePrecision(points:Vector.<Point>)
		{
			_allPoints = points.concat();
			
			_points = points.concat();
			_firstPoint = Point(_points.shift()).clone();
			_lastPoint = Point(_points.pop()).clone();
			
			_direction = Math.atan2(_lastPoint.y - _firstPoint.y, _lastPoint.x - _firstPoint.x);
		}
		// create a LinePrecision instance
		public static function createLinePrecision(points:Array, distanceMaximum:Number):ILinePrecision
		{
			var line:LinePrecision = new LinePrecision(points);
			line.calculatePrecision(distanceMaximum);
			
			return line;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROPERTIES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _points:Vector.<Point>;
		private var _allPoints:Vector.<Point>;
		public function get points():Vector.<Point>
		{
			return _allPoints;
		}
		private var _direction:Number;
		public function get direction():Number
		{
			return _direction;
		}
		private const CONVERT_TO_DEGREES:Number = 180 / Math.PI;
		public function get directionDegrees():Number
		{
			return _direction * CONVERT_TO_DEGREES;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CALCULATION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _precision:Number = -1;
		public function get precision():Number
		{
			return _precision;
		}
		public function calculatePrecision(distanceMaximum:Number):Number
		{
			var counter:Number = 0;
			var point:Point;
			for each(point in _points)
			{
				if(getDistanceFromLine(_firstPoint, _lastPoint, point.clone()) <= distanceMaximum)
				{
					counter++;
				}
			}
			
			return (_precision = (counter / _points.length));
		}
		private function getDistanceFromLine(a:Point, b:Point, c:Point):Number
		{
			c.y *= -1;
			
			// flip for Flash
			var mInvert:Number = 1 / ((a.y - b.y) / (a.x - b.x));
			var B:Number = mInvert * c.x - c.y;
			
			// use Keith's function to check for an intersection
			var intersection:Point = lineIntersectLine(
														a,
														b,
														new Point(b.x, -b.x * mInvert + B),
														new Point(a.x, -a.x * mInvert + B),
														true
													);
			if(intersection)
			{
				var dx:Number = intersection.x - c.x;
				var dy:Number = intersection.y + c.y;
				
				return Math.pow(dx * dx + dy * dy, .5) >> 0;
			}
			
			return Number.POSITIVE_INFINITY;
		}
		// Keith Hair's line intersection function
		// http://keith-hair.net/blog/2008/08/04/find-intersection-point-of-two-lines-in-as3/
		private function lineIntersectLine(A:Point, B:Point, E:Point, F:Point, asSeg:Boolean = false):Point
		{
			var a1:Number = B.y - A.y;
			var a2:Number = F.y - E.y;
			var b1:Number = A.x - B.x;
			var b2:Number = E.x - F.x;
			var c1:Number = B.x * A.y - A.x * B.y;
			var c2:Number = F.x * E.y - E.x * F.y;

			var denom:Number = a1 * b2 - a2 * b1;
			if(denom == 0)
			{
				return null;
			}

			var ip:Point = new Point((b1 * c2 - b2 * c1) / denom, (a2 * c1 - a1 * c2) / denom);
			
			// ---------------------------------------------------
			// Do checks to see if intersection to endpoints
			// distance is longer than actual Segments.
			// Return null if it is with any.
			// ---------------------------------------------------
			if(asSeg)
			{
				if(
					(Math.pow(ip.x - B.x, 2) + Math.pow(ip.y - B.y, 2) > Math.pow(A.x - B.x, 2) + Math.pow(A.y - B.y, 2)) ||
					(Math.pow(ip.x - A.x, 2) + Math.pow(ip.y - A.y, 2) > Math.pow(A.x - B.x, 2) + Math.pow(A.y - B.y, 2)) ||
					(Math.pow(ip.x - F.x, 2) + Math.pow(ip.y - F.y, 2) > Math.pow(E.x - F.x, 2) + Math.pow(E.y - F.y, 2)) ||
					(Math.pow(ip.x - E.x, 2) + Math.pow(ip.y - E.y, 2) > Math.pow(E.x - F.x, 2) + Math.pow(E.y - F.y, 2))
				)
				{
					return null;
				}
			}
			
			return ip;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// UTILS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function toString():String
		{
			return "Line: " + _allPoints.length + " points, direction " + _direction + ", precision " + _precision;
		}
	}
}