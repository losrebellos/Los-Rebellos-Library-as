package losrebellos.events 
{	import flash.events.Event;

	/*	 *	 * @author los rebellos	 *	 */	public class VideoEvent extends EventPlus
	{
		/*
		 * 
		 * EVENTS
		 * 
		 */
		public static const PLAY:String = "videoEvent/play";
		public static const COMPLETE:String = "videoEvent/complete";
		public static const BUFFERING:String = "videoEvent/buffering";
		public static const BUFFER_FULL:String = "videoEvent/bufferFull";
		public static const ERROR:String = "videoEvent/error";
		
		//data
		public var data:String = "";
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */		public function VideoEvent(type:String, _data:String = "")
		{
			data = _data;			super(type);		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function clone():Event
		{
			return new VideoEvent(this.type, this.data);
		}
	}}