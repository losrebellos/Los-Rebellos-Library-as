package losrebellos.media.players 
{
	import losrebellos.display.SpritePlus;
	import losrebellos.interfaces.IScale;
	import losrebellos.media.stream.IStream;
	import losrebellos.media.stream.VideoStream;
	import losrebellos.scale.FitType;
	import losrebellos.scale.PositionType;
	import losrebellos.scale.Scale;

	import flash.geom.Rectangle;
	import flash.media.Video;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class VideoPlayer extends SpritePlus implements IPlayer, IScale
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		
		//video
		protected var video_stream:VideoStream;
		protected var video:Video;
		
		//size
		private var video_width:int;
		private var video_height:int;
		private var ratio:Number;
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
		 * DATA
		 * 
		 */
		public function get state():String
		{
			return video_stream.state;
		}		public function getPercentLoaded():Number
		{
			return video_stream.getPercentLoaded();
		}
		public function getPercentPlayed():Number
		{
			return video_stream.getPercentPlayed();
		}

		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		public function load(stream:IStream):void
		{
			video_stream = stream as VideoStream;
			video_stream.load();
			video.attachNetStream(video_stream.stream);
		}
		public function play(_percent:Number = 0, _loop:int = 1):void
		{
			video_stream.loop = _loop;
			video_stream.play(_percent, _loop);
		}
		public function resume():void
		{
			video_stream.resume();
		}
		public function pause():void
		{
			video_stream.pause();
		}
		public function stop():void
		{
			video_stream.stop();
		}
		public function seek(_percent:Number):void
		{
			video_stream.seek(_percent);
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
		public function destroyStream():void
		{
			video_stream.destroy();
		}
	}
}