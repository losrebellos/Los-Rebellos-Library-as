package losrebellos.events {	import flash.events.Event;				/*	 *	 * @author los rebellos	 *	 */	public class StreamEvent extends EventPlus 	{		/*		 * 		 * EVENTS		 * 		 */		public static const PLAY:String = "streamEvent/play";		public static const PAUSE:String = "streamEvent/pause";		public static const COMPLETE:String = "streamEvent/complete";		public static const BUFFERING:String = "streamEvent/buffering";		public static const BUFFER_FULL:String = "streamEvent/bufferFull";		public static const ERROR:String = "streamEvent/error";				//data		public var data:String = "";						/*		 * 		 * CONSTRUCTOR		 * 		 */		public function StreamEvent(type:String, _data:String = "")		{			data = _data;			super(type);		}						/*		 * 		 * UTILS		 * 		 */		override public function clone():Event		{			return new StreamEvent(this.type, this.data);		}	}}