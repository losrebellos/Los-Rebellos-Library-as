package com.losrebellos.geom
{
	import flash.geom.IPerspectiveProjection;
	import flash.geom.PerspectiveProjection;
	import flash.geom.Point;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public class PerspectiveProjectionPlus extends PerspectiveProjection implements IPerspectiveProjection
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function PerspectiveProjectionPlus(projectionCenter:Point = null, fieldOfView:Number = NaN, focalLength:Number = NaN)
		{
			super();
			
			if(projectionCenter)
			{
				this.projectionCenter = projectionCenter;
			}
			
			if(!isNaN(fieldOfView))
			{
				this.fieldOfView = fieldOfView;
			}
			
			if(!isNaN(focalLength))
			{
				this.focalLength = focalLength;
			}
		}
	}
}
