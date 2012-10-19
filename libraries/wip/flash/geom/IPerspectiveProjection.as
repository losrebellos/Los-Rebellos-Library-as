package flash.geom
{
	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public interface IPerspectiveProjection
	{
		function set fieldOfView(fieldOfViewAngleInDegrees:Number):void;
		function get fieldOfView():Number;
		
		function set focalLength(value:Number):void;
		function get focalLength():Number;
		
		function set projectionCenter(p:Point):void;
		function get projectionCenter():Point;
		
		function toMatrix3D():Matrix3D;
	}
}