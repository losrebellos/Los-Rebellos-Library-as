package com.losrebellos.old.font 
{
	import com.losrebellos.events.EventDispatcherPlus;
	import com.losrebellos.interfaces.IDisposable;
	import com.losrebellos.old.external.explorer.SWF;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;



	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class EmbeddedFonts extends EventDispatcherPlus implements IDisposable
	{
		// should be extended with the correct source for the Embed
		// example
//		[Embed(source='../../flas/Fonts.swf', mimeType='application/octet-stream')]
//		private const Fonts:Class;
		//
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _loader:Loader;
		protected var _tabFonts:Array;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function EmbeddedFonts(fonts:ByteArray)
		{
			super();
			
			//get the fonts list
			_tabFonts = SWF.parse(fonts);
			
			//load the bytes
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onBytesComplete, false, 0, true);
			_loader.loadBytes(fonts);
		}
		protected function onBytesComplete(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onBytesComplete);
			
			//get the application domain
			var applicationDomain:ApplicationDomain = _loader.contentLoaderInfo.applicationDomain;
			
			//register the font
			for(var i:int = 0; i<_tabFonts.length; i++)
			{
				Fonts.instance.add(_tabFonts[i], applicationDomain.getDefinition(_tabFonts[i]) as Class);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose(e:Event = null):void
		{
			_loader.close();
			_loader = null;
		}
	}
}