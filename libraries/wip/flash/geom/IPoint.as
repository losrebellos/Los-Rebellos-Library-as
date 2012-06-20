package flash.geom
{
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IPoint
	{
		function add(v:Point):Point;
		
		
		function clone():Point;
		
		
		function equals(toCompare:Point):Boolean;
		
		
		function get length():Number;
		
		
		function normalize(thickness:Number):void;
		
		
		function offset(dx:Number, dy:Number):void;
		
		
		function subtract(v:Point):Point;
		
		
		function toString():String;
	}
}