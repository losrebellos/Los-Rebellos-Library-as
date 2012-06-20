package com.losrebellos.geom 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPoint3D 
	{
		 function add(v:Point3D):Point3D;
		 function subtract(v:Point3D):Point3D;
		 function offset(dx:Number, dy:Number, dz:Number):void;
		 function equals(toCompare:Point3D):Boolean;
		
		 function get length():Number;
		 function distance(pt:Point3D):Number;
		 function normalize(thickness:Number):void;
		
		 function interpolate(pt:Point3D, f:Number):Point3D;
		
		 function clone():Point3D;
		 function toString():String;
	}
}