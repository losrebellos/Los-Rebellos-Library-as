package losrebellos.geom 
{
	import flash.geom.Point;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPointPlus 
	{
		function add(v:Point):Point;
		
		
		function clone():Point;
		
		
		function equals(toCompare:Point):Boolean;
		
		
		function get length():Number;
		
		
		function normalize(thickness:Number):void;
		
		
		function offset(dx:Number, dy:Number):void;
		
		
		function subtract(v:Point):Point;
		
		
		function toString():String;
		
		
		/*
		 * 
		 * CUSTOM
		 * 
		 */
		function angle(p:Point):Number;
	}
}
