package com.losrebellos.project.media.webcam
{
	import com.losrebellos.events.EventDispatcherPlus;
	import com.losrebellos.system.FlashPlayer;

	import flash.events.ActivityEvent;
	import flash.events.StatusEvent;
	import flash.media.Camera;
	import flash.media.Video;



	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class Webcam extends EventDispatcherPlus implements IWebcam
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static const ISIGHT:String		= "USB Video Class Video";
		protected const DEFAULT_WIDTH:int		= 320;
		protected const DEFAULT_HEIGHT:int		= 240;
		protected const DEFAULT_FRAME_RATE:int	= 12;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _isMac:Boolean;
		protected var _width:int;
		protected var _height:int;
		protected var _frameRate:int;
		protected var _camera:Camera;
		protected var _video:Video;		// to have the Settings popping
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function Webcam(width:int = DEFAULT_WIDTH, height:int = DEFAULT_HEIGHT, frameRate:int = DEFAULT_FRAME_RATE)
		{
			_width = width;
			_height = height;
			_frameRate = frameRate;
			_video = new Video(_width, _height);
			
			super();
			
			initOS();
		}
		public function get camera():Camera
		{
			return _camera;
		}
		public function get defaultVideo():Video
		{
			return _video;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CAMERA
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function initOS():void
		{
			_isMac = FlashPlayer.isMac();
			
			this.dispatchEvent(new WebcamEvent((_isMac ? WebcamEvent.IS_MAC : WebcamEvent.IS_PC)));
		}
		protected function initCamera() : void
		{
			// create the camera
			_camera = Camera.getCamera();
			
			// has no camera
			if(_camera == null || Camera.names.length < 1)
			{
				this.dispatchEvent(new WebcamEvent(WebcamEvent.NO_CAMERA));
			}
			
			// has a camera
			else
			{
				// is a mac computer
				if(_isMac)
				{
					for(var i:int = 0; i<Camera.names.length; i++)
					{
						if( String(Camera.names[i]).toLowerCase() == ISIGHT.toLowerCase() )
						{
							_camera = Camera.getCamera(String(i));
							break;
						}
					}
				}
				
				// is not a mac computer
				else
				{
					// which input?
				}
				
				_camera.setMode(_width, _height, _frameRate);
				_video.attachCamera(_camera);
				
				this.dispatchEvent(new WebcamEvent(WebcamEvent.CAMERA));
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INTERACTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function enable():void
		{
			initCamera();
			addEvents();
		}
		public function disable():void
		{
			removeEvents();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function addEvents():void
		{
			if(_camera)
			{
				_camera.addEventListener(StatusEvent.STATUS, webcamStatusHandler);
				_camera.addEventListener(ActivityEvent.ACTIVITY, cameraActivityHandler);
			}
		}
		protected function removeEvents():void
		{
			if(_camera)
			{
				_camera.removeEventListener(StatusEvent.STATUS, webcamStatusHandler);
				_camera.removeEventListener(ActivityEvent.ACTIVITY, cameraActivityHandler);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// HANDLERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function webcamStatusHandler(e:StatusEvent):void
		{
        	this.dispatchEvent(new WebcamEvent(WebcamEvent.STATUS));
		}
        protected function cameraActivityHandler(e:ActivityEvent):void
        {
        	this.dispatchEvent(new WebcamEvent(WebcamEvent.ACTIVITY));
        }
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DEFAULT FOR CAMERA
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get activityLevel():Number
		{
			return _camera.activityLevel;
		}
		public function get bandwidth():int
		{
			return _camera.bandwidth;
		}
		public function get currentFPS():Number
		{
			return _camera.currentFPS;
		}
		public function get fps():Number
		{
			return _camera.fps;
		}
		public function get index():int
		{
			return _camera.index;
		}
		public function get keyFrameInterval():int
		{
			return _camera.keyFrameInterval;
		}
		public function get loopback():Boolean
		{
			return _camera.loopback;
		}
		public function get motionLevel():int
		{
			return _camera.motionLevel;
		}
		public function get motionTimeout():int
		{
			return _camera.motionTimeout;
		}
		public function get muted():Boolean
		{
			return _camera.muted;
		}
		public function get name():String
		{
			return _camera.name;
		}
		public function get quality():int
		{
			return _camera.quality;
		}
		public function setCursor(value:Boolean):void
		{
			_camera.setCursor(value);
		}
		public function setKeyFrameInterval(keyFrameInterval:int):void
		{
			_camera.setKeyFrameInterval(keyFrameInterval);
		}
		public function setLoopback(compress:Boolean = false):void
		{
			_camera.setLoopback(compress);
		}
		public function setMode(width:int, height:int, fps:Number, favorArea:Boolean = true):void
		{
			_camera.setMode(width, height, fps, favorArea);
		}
		public function setMotionLevel(motionLevel:int, timeout:int = 2000):void
		{
			_camera.setMotionLevel(motionLevel, timeout);
		}
		public function setQuality(bandwidth:int, quality:int):void
		{
			_camera.setQuality(bandwidth, quality);
		}
		public function get width():int
		{
			return _camera.width;
		}
		public function get height():int
		{
			return _camera.height;
		}
	}
}