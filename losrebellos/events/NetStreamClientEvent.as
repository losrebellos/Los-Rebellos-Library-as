package losrebellos.events {	import flash.events.Event;	/*	 *	 * @author los rebellos	 *	 */	public class NetStreamClientEvent extends EventPlus	{		/*		 * 		 * EVENTS		 * 		 */		public static const META_DATA_LOADED:String = "netStreamClient/metaData/loaded";		public static const CUE_POINT:String = "netStreamClient/cuePoint";		public static const IMAGE_DATA:String = "netStreamClient/imageData";		public static const PLAY_STATUS:String = "netStreamClient/playStatus";		public static const TEXT_DATA:String = "netStreamClient/textData";		public static const XMP_DATA_ERROR:String = "netStreamClient/error/xmpData";						/*		 * 		 * CONSTRUCTOR		 * 		 */		public function NetStreamClientEvent(type:String)		{			super(type);		}						/*		 * 		 * UTILS		 * 		 */		override public function clone():Event		{			return new NetStreamClientEvent(this.type);		}	}}