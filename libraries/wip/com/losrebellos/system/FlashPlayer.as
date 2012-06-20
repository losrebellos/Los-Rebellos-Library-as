package com.losrebellos.system 
{
	import flash.system.Capabilities;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class FlashPlayer 
	{
		// flash player version
		public static function version():String
		{
			// Get the player’s version by using the flash.system.Capabilities class.
			var versionNumber:String = Capabilities.version;
			
			// The version number is a list of items divided by “,”
			var versionArray:Array = versionNumber.split(",");
			
			// The main version contains the OS type too so we split it in two
			// and we’ll have the OS type and the major version number separately.
			var platformAndVersion:Array = String(versionArray[0]).split(" ");
			
			var majorVersion:Number = parseInt(platformAndVersion[1]);
			var minorVersion:Number = parseInt(versionArray[1]);
			var buildNumber:Number = parseInt(versionArray[2]);
			
			return "Flash Player => Version: " + versionNumber + ", Platform: " + platformAndVersion[0] + " (major: " + majorVersion + ", minor: " + minorVersion + ", build: " + buildNumber + ")";
		}
		
		
		// is a Mac?
		protected static const MAC:String = "mac";
		public static function isMac():Boolean
		{
			return Capabilities.os.toLowerCase().indexOf(MAC) == 0;
		}
	}
}