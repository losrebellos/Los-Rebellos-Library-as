package losrebellos.media.players 
{
	import losrebellos.interfaces.IScale;
	import losrebellos.media.stream.IStream;
	import losrebellos.media.stream.VideoStream;
	import losrebellos.scale.FitType;
	import losrebellos.scale.PositionType;
	import losrebellos.scale.Scale;

	import flash.errors.IllegalOperationError;
	import flash.geom.Rectangle;
	import flash.media.Video;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class VideoPlayer extends Player implements IScale
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		
		//video
		protected var video:Video;
		
		//size
		protected var video_width:int;
		protected var video_height:int;
		protected var ratio:Number;
		public var autoSize:Boolean = false;
		private var _fit_type:String = FitType.OUTSIDE;
		private var _position_type:String = PositionType.MIDDLE;
		private var _rect:Rectangle = null;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function VideoPlayer(_video_width:int = 320, _video_height:int = 240)
		{
			video_width = _video_width;
			video_height = _video_height;
			ratio = video_width / video_height;
			
			super();
		}
		
		
		/*
		 * 
		 * WIDTH & HEIGHT
		 * 
		 */
		override public function set width(value:Number):void
		{
			autoSize = false;
			video.width = video_width = value;
		}
		override public function get width():Number
		{
			return video_width;
		}
		override public function set height(value:Number):void
		{
			autoSize = false;
			video.height = video_height = value;
		}
		override public function get height():Number
		{
			return video_height;
		}
		
		
		/*
		 * 
		 * CONTENT
		 * 
		 */
		override protected function createContent():void
		{
			video = new Video(video_width, video_height);
			video.smoothing = true;
		}
		override protected function addContent():void
		{
			this.addChild(video);
		}

		
		/*
		 * 
		 * LOAD
		 * 
		 */
		override public function load(stream:IStream):void
		{
			if(!(stream is VideoStream))
				throw new IllegalOperationError(">>>>> VideoPlayer: stream not valid (VideoStream)");
			
			super.load(stream);
			
			video.attachNetStream((stream as VideoStream).stream);
		}
		
		
		/*
		 * 
		 * SIZE
		 * 
		 */
		override protected function setSize():void
		{
			//resizing from metadata values
			if(autoSize)
			{
				video.width = video_width = (stream as VideoStream).getMetadata().width;
				video.height = video_height = (stream as VideoStream).getMetadata().height;
			}
			
			//if need to fit
			else if(_rect)
				resize(_rect);
			
			//normal resize
			else
			{
				video.width = video_width;
				video.height = video_height;
			}
		}
		
		
		/*
		 * 
		 * FIT, POSITION & RESIZE
		 * 
		 */
		public function set fitType(value:String):void
		{
			_fit_type = value;
			
			if(_rect)
				resize(_rect);
		}
		public function get fitType():String
		{
			return _fit_type;
		}
		public function set positionType(value:String):void
		{
			_position_type = value;
			
			if(_rect)
				resize(_rect);
		}
		public function get positionType():String
		{
			return _position_type;
		}
		override public function resize(rect:Rectangle):void
		{
			_rect = rect;
			
			Scale.setScaledRectangle(_fit_type, _position_type, new Rectangle(0, 0, video_width, video_height), _rect, video);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function destroyStream():void
		{
			super.destroyStream();
			
			video.attachNetStream(null);
		}
	}
}