package com.losrebellos.old.asset 
{
	import com.losrebellos.display.bitmap.BitmapPlus;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AssetsWrapper 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		protected var _mc:MovieClip;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AssetsWrapper(mc:MovieClip):void
		{
			_mc = mc;
		}
		
		
		/*
		 * 
		 * BYTEARRAY
		 * 
		 */
		public function getByteArray():ByteArray
		{
			return _mc.loaderInfo.bytes;
		}
		
		
		/*
		 * 
		 * CLASSES
		 * 
		 */
		public function getApplicationDomain():ApplicationDomain
		{
			var loader:Loader = _mc.loaderInfo.loader;
			return loader.contentLoaderInfo.applicationDomain;
		}
		public function getClass(name:String):Class
		{
			var loader:Loader = _mc.loaderInfo.loader;
			var app:ApplicationDomain = loader.contentLoaderInfo.applicationDomain;
			
			try
			{
				return app.getDefinition(name) as Class;
			}
			catch(e:*)
			{
				trace(this, "no Class [" + name + "]");
			}
			
			return null;
		}
		public function getClassInstance(name:String):*
		{
			var c:Class = this.getClass(name);
			return new c;
		}
		public function getClassInstanceAs(name:String, c:Class):*
		{
			return getClassInstance(name) as c;
		}
		
		
		/*
		 * 
		 * IMAGE
		 * 
		 */
		public function getBitmapDataFromClass(name:String, w:Number, h:Number):BitmapData
		{
			var c:Class = this.getClass(name);
			return new c(w, h);
		}
		public function getBitmapFromClass(name:String, w:Number, h:Number):Bitmap
		{
			return new Bitmap(getBitmapDataFromClass(name, w, h));
		}
		public function getBitmapPlusFromClass(name:String, w:Number, h:Number):BitmapPlus
		{
			return new BitmapPlus(getBitmapDataFromClass(name, w, h));
		}
	}
}