package com.losrebellos.project.media.player 
{
	import com.losrebellos.project.media.player.stream.IStream;
	import com.losrebellos.project.media.player.stream.VideoStream;
	import com.losrebellos.scale.FitType;
	import com.losrebellos.scale.PositionType;
	import com.losrebellos.scale.Scale;

	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.media.Video;




	/*
	 *
	 * @author los rebellos
	 *
	 */
	public final class VideoPlayer extends Player implements IPlayer
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _video:Video;
		private var _videoWidth:int;
		private var _videoHeight:int;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function VideoPlayer(videoWidth:int = 320, videoHeight:int = 240)
		{
			_videoWidth = videoWidth;
			_videoHeight = videoHeight;
			
			super();
			
			_video = new Video(_videoWidth, _videoHeight);
			this.addChild(_video);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SMOOTHING
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set smoothing(value:Boolean):void
		{
			_video.smoothing = value;
		}
		public function get smoothing():Boolean
		{
			return _video.smoothing;
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOAD
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SIZE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public var autoSize:Boolean = false;
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
			{
				resize();
			}
			
			//normal resize
			else
			{
				_video.width = _videoWidth;
				_video.height = _videoHeight;
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// FIT, POSITION & RESIZE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _fitType:String = FitType.OUTSIDE;
		public function set fitType(value:String):void
		{
			_fitType = value;
			
			if(_rect)
			{
				resize();
			}
		}
		public function get fitType():String
		{
			return _fitType;
		}
		private var _positionType:String = PositionType.MIDDLE;
		public function set positionType(value:String):void
		{
			_positionType = value;
			
			if(_rect)
			{
				resize();
			}
		}
		public function get positionType():String
		{
			return _positionType;
		}
		protected var _rect:Rectangle;
		override public function resize():void
		{
			Scale.setScaledRectangle(_fitType, _positionType, new Rectangle(0, 0, _videoWidth, _videoHeight), _rect, _video);
		}
		override public function render():void
		{
			
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose(e:Event = null):void
		{
			super.dispose(e);
			
			_video.attachNetStream(null);
			_video = null;
			
			_rect = null;
		}
	}
}