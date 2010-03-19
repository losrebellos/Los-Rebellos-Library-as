package losrebellos.events 
{

	/*
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
		 */
		{
			data = _data;
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function clone():Event
		{
			return new VideoEvent(this.type, this.data);
		}
	}