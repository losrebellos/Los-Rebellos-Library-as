package losrebellos.media.cuepoint.utils 
{
	import flash.events.EventDispatcher;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class OvpDfxpWrapper extends EventDispatcher 
	{
		/*
		 * 
		 * CONSTANTS
		 * 
		 */
		private const start_tag:String = "<tt xml:lang='en' xmlns='http://www.w3.org/2006/04/ttaf1' xmlns:tts='http://www.w3.org/2006/04/ttaf1#styling'><head><styling></styling></head><body><div>";
		private const end_tag:String = "</div></body></tt>";
		
		
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		private var _xml:XML;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function OvpDfxpWrapper(xml:XML)
		{
			_xml = xml;
			
			super();
		}
		
		
		/*
		 * 
		 * WRAP
		 * 
		 */
		public function wrap():XML
		{
			//dirty but working
			return new XML(start_tag + (_xml["p"] as XMLList).toString() + end_tag);
		}
	}
}