package losrebellos.lospistoleros.data 
{
	import losrebellos.events.EventDispatcherPlus;

	import flash.display.Loader;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class EmbeddedFonts extends EventDispatcherPlus 
	{
		// example
//		[Embed(source='../../flas/Fonts.swf', mimeType='application/octet-stream')]
//		private const Fonts:Class;
		
		
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var loader:Loader;
		protected var tab_fonts:Array;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function EmbeddedFonts(ba_fonts:ByteArray)
		{
			super();
			
			//get the fonts list
			tab_fonts = SWF.parse(ba_fonts);
			
			//load the bytes
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, bytesCompleteHandler);
			loader.loadBytes(ba_fonts);
		}
		protected function bytesCompleteHandler(e:Event):void
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, bytesCompleteHandler);
			
			//get the application domain
			var app:ApplicationDomain = loader.contentLoaderInfo.applicationDomain;
			
			//register the font
			for(var i:int = 0; i<tab_fonts.length; i++)
				Fonts.instance.add(tab_fonts[i], app.getDefinition(tab_fonts[i]) as Class);
		}
	}
}