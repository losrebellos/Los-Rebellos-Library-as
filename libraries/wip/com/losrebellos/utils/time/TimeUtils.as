package com.losrebellos.utils.time 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class TimeUtils 
	{
		public static function formatSeconds(time:Number, separator:String = ":"):String
		{
			var generalSeconds:Number = time;
			var seconds:int = generalSeconds % 60;
			var generalMinutes:int = generalSeconds / 60;
			var minutes:int = generalMinutes % 60;
			var hours:int = generalMinutes / 60;
			
			return format(hours) + separator + format(minutes) + separator + format(seconds);
		}
		
		
		private static function format(value:int):String
		{
			var s:String = value + "";
			return (s.length < 2) ? ("0" + s) : s;
		}
	}
}