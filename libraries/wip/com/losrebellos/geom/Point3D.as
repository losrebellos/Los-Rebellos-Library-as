package com.losrebellos.geom 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class Point3D extends Object implements IPoint3D
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function Point3D(x:Number = 0, y:Number = 0, z:Number = 0)
		{
			this.x = x;
			this.y = y;
			this.z = z;
			
			super();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// METHODS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function add(v:Point3D):Point3D
		{
			return new Point3D(this.x + v.x, this.y + v.y, this.z + v.z);
		}
		public function subtract(v:Point3D):Point3D
		{
			return new Point3D(this.x - v.x, this.y - v.y, this.z - v.z);
		}
		public function offset(dx:Number, dy:Number, dz:Number):void
		{
			this.x += dx;
			this.y += dy;
			this.z += dz;
		}
		public function equals(toCompare:Point3D):Boolean
		{
			return (this.x == toCompare.x) && (this.y == toCompare.y) && (this.z == toCompare.z);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISTANCE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get length():Number
		{
			return Math.sqrt(this.x * this.x + this.y * this.y + this.z * this.z);
		}
		public function distance(pt:Point3D):Number
		{
			var ptsX:Number = this.x - pt.x;
			var ptsY:Number = this.y - pt.y;
			var ptsZ:Number = this.z - pt.z;
			
			return Math.sqrt(ptsX * ptsX + ptsY * ptsY + ptsZ * ptsZ);
		}
		public static function distance(pt1:Point3D, pt2:Point3D):Number
		{
			var ptsX:Number = pt2.x - pt1.x;
			var ptsY:Number = pt2.y - pt1.y;
			var ptsZ:Number = pt2.z - pt1.z;
			
			return Math.sqrt(ptsX * ptsX + ptsY * ptsY + ptsZ * ptsZ);
		}
		public function normalize(thickness:Number):void
		{
			var percent:Number = thickness / length;
			this.x *= percent;
			this.y *= percent;
			this.z *= percent;
		}
		public static function polar(len:Number, angle1:Number, angle2:Number):Point3D
		{
			return new Point3D(len * Math.sin(angle1) * Math.cos(angle2), len * Math.sin(angle1) * Math.sin(angle2), len * Math.cos(angle1));
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INTERPOLATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function interpolate(pt:Point3D, f:Number):Point3D
		{
			var _f:Number = f - 1;
			return new Point3D(this.x * f + pt.x * _f, this.y * f + pt.y * _f, this.z * f + pt.z * _f);
		}
		public static function interpolate(pt1:Point3D, pt2:Point3D, f:Number):Point3D
		{
			var _f:Number = f - 1;
			return new Point3D(pt1.x * f + pt2.x * _f, pt1.y * f + pt2.y * _f, pt1.z * f + pt2.z * _f);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// UTILS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function clone():Point3D
		{
			return new Point3D(this.x, this.y, this.z);
		}
		public function toString():String
		{
			return "Point3D: (x = " + this.x + ", y = " + this.y + ", z = " + this.z + ")";
		}
	}
}