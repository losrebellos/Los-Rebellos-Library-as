package com.losrebellos.project.media.webcam
{
	import com.losrebellos.events.EventPlus;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class WebcamEvent extends EventPlus
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		// os
		public static const IS_MAC:String		= "WebcamEvent/system/mac";
		public static const IS_PC:String		= "WebcamEvent/system/pc";
		
		// no camera
		public static const NO_CAMERA:String	= "WebcamEvent/camera/no";
		public static const CAMERA:String		= "WebcamEvent/camera";
		
		// status & activity
		public static const STATUS:String		= "WebcamEvent/status";
		public static const ACTIVITY:String		= "WebcamEvent/activity";
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function WebcamEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}