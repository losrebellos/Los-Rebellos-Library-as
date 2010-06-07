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
		protected var _loader:Loader;
		protected var _tabFonts:Array;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function EmbeddedFonts(ba_fonts:ByteArray)
		{
			super();
			
			//get the fonts list
			_tabFonts = SWF.parse(ba_fonts);
			
			//load the bytes
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, bytesCompleteHandler);
			_loader.loadBytes(ba_fonts);
		}
		protected function bytesCompleteHandler(e:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, bytesCompleteHandler);
			
			//get the application domain
			var app:ApplicationDomain = _loader.contentLoaderInfo.applicationDomain;
			
			//register the font
			for(var i:int = 0; i<_tabFonts.length; i++)
			{
				Fonts.instance.add(_tabFonts[i], app.getDefinition(_tabFonts[i]) as Class);
			}
		}
	}
}