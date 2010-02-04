package losrebellos.events {	import flash.events.Event;	/*	 *	 * @author los rebellos	 *	 */	public class StreamEvent extends EventPlus 	{		/*		 * 		 * EVENTS		 * 		 */		public static const PROGRESS:String = "streamEvent/progress";		public static const READY:String = "streamEvent/ready";		public static const COMPLETE:String = "streamEvent/complete";				public static const PLAY:String = "streamEvent/play";		public static const PAUSE:String = "streamEvent/pause";		public static const STREAM_COMPLETE:String = "streamEvent/streamComplete";				public static const BUFFERING:String = "streamEvent/buffering";		public static const BUFFER_FULL:String = "streamEvent/bufferFull";				public static const ERROR:String = "streamEvent/error";		public static const STREAM_INITIALIZED:String = "streamEvent/streamInitialized";				//data		public var data:* = "";						/*		 * 		 * CONSTRUCTOR		 * 		 */		public function StreamEvent(type:String, _data:* = "")		{			data = _data;			super(type);		}						/*		 * 		 * UTILS		 * 		 */		override public function clone():Event		{			return new StreamEvent(this.type, this.data);		}	}}