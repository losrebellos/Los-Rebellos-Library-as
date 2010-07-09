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
	public class VideoPlayer extends Player implements IPlayer, IScale
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		
		//video
		protected var _video:Video;
		
		//size
		protected var _videoWidth:int;
		protected var _videoHeight:int;
		protected var _ratio:Number;
		public var autoSize:Boolean = false;
		private var _fitType:String = FitType.OUTSIDE;
		private var _positionType:String = PositionType.MIDDLE;
		private var _rect:Rectangle = null;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function VideoPlayer(videoWidth:int = 320, videoHeight:int = 240)
		{
			_videoWidth = videoWidth;
			_videoHeight = videoHeight;
			_ratio = _videoWidth / _videoHeight;
			
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
			_video.width = _videoWidth = value;
		}
		override public function get width():Number
		{
			return _videoWidth;
		}
		override public function set height(value:Number):void
		{
			autoSize = false;
			_video.height = _videoHeight = value;
		}
		override public function get height():Number
		{
			return _videoHeight;
		}
		public function set smoothing(value:Boolean):void
		{
			_video.smoothing = value;
		}
		public function get smoothing():Boolean
		{
			return _video.smoothing;
		}
		
		
		/*
		 * 
		 * CONTENT
		 * 
		 */
		override protected function createContent():void
		{
			_video = new Video(_videoWidth, _videoHeight);
		}
		override protected function addContent():void
		{
			this.addChild(_video);
		}

		
		/*
		 * 
		 * LOAD
		 * 
		 */
		override public function load(stream:IStream):void
		{
			if(!(stream is VideoStream))
			{
				throw new IllegalOperationError(">>>>> VideoPlayer: stream not valid (VideoStream)");
			}
			
			super.load(stream);
			
			_video.attachNetStream((stream as VideoStream).stream);
			_video.smoothing = true;
		}
		override public function unLoad():void
		{
			super.unLoad();
			
			_video.attachNetStream(null);
			_video.clear();
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
				_video.width = _videoWidth = (_stream as VideoStream).getMetadata().width;
				_video.height = _videoHeight = (_stream as VideoStream).getMetadata().height;
			}
			
			//if need to fit
			else if(_rect)
				resize(_rect);
			
			//normal resize
			else
			{
				_video.width = _videoWidth;
				_video.height = _videoHeight;
			}
		}
		
		
		/*
		 * 
		 * FIT, POSITION & RESIZE
		 * 
		 */
		public function set fitType(value:String):void
		{
			_fitType = value;
			
			if(_rect)
				resize(_rect);
		}
		public function get fitType():String
		{
			return _fitType;
		}
		public function set positionType(value:String):void
		{
			_positionType = value;
			
			if(_rect)
				resize(_rect);
		}
		public function get positionType():String
		{
			return _positionType;
		}
		override public function resize(rect:Rectangle):void
		{
			_rect = rect;
			
			Scale.setScaledRectangle(_fitType, _positionType, new Rectangle(0, 0, _videoWidth, _videoHeight), _rect, _video);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function destroyStream():void
		{
			super.destroyStream();
			
			_video.attachNetStream(null);
		}
	}
}