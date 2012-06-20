package com.losrebellos.project.media.youtube
{
	import com.losrebellos.display.base.SpritePlus;
	import com.losrebellos.project.display.spinner.ISpinner;
	import com.losrebellos.project.display.spinner.Spinner;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.net.URLRequest;



	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public final class YoutubePlayer extends SpritePlus implements IYoutubePlayer
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static const URL:String			= "http://www.youtube.com/v/";
		private static const VERSION:String		= "?version=3";
		
		// events
		private static const ON_READY:String					= "onReady";
		private static const ON_ERROR:String					= "onError";
		private static const ON_STATE_CHANGE:String				= "onStateChange";
		private static const ON_PLAYBACK_QUALITY_CHANGE:String	= "onPlaybackQualityChange";
		
		// functions
		private static const FUNCTION_STOP_VIDEO:String		= "stopVideo";
		private static const FUNCTION_PAUSE_VIDEO:String	= "pauseVideo";
		private static const FUNCTION_PLAY_VIDEO:String		= "playVideo";
		private static const FUNCTION_SET_SIZE:String		= "setSize";
		private static const FUNCTION_SEEK_TO:String		= "seekTo";
		
		// states
		public static const STATE_UNSTARTED:int		= -1;
		public static const STATE_ENDED:int			= 0;
		public static const STATE_PLAYING:int		= 1;
		public static const STATE_PAUSED:int		= 2;
		public static const STATE_BUFFERING:int		= 3;
		public static const STATE_VIDEO_CUED:int	= 5;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _width:int;
		private var _height:int;
		private var _id:String;
		private var _player:Object;
		private var _loader:Loader;
		private var _paused:Boolean = false;
		private var _spinner:ISpinner;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function YoutubePlayer(spinner:ISpinner = null)
		{
			super();
			
			_loader = new Loader();
		    this.addChild(_loader);
			
			_spinner = spinner || new Spinner();
			_spinner.enable();
			this.addChild(_spinner as DisplayObject);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function addEvents():void
		{
		    _loader.content.addEventListener(ON_READY, onPlayerReady);
		    _loader.content.addEventListener(ON_ERROR, onPlayerError);
		    _loader.content.addEventListener(ON_STATE_CHANGE, onPlayerStateChange);
		    _loader.content.addEventListener(ON_PLAYBACK_QUALITY_CHANGE, onVideoPlaybackQuality);
		}
		private function removeEvents():void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.INIT, onLoaderInit);
			
		    if(_loader.content)
		    {
			    _loader.content.removeEventListener(ON_READY, onPlayerReady);
			    _loader.content.removeEventListener(ON_ERROR, onPlayerError);
			    _loader.content.removeEventListener(ON_STATE_CHANGE, onPlayerStateChange);
			    _loader.content.removeEventListener(ON_PLAYBACK_QUALITY_CHANGE, onVideoPlaybackQuality);
		    }
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTROLS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function play(id:String, width:int = 480, height:int = 360):void
		{
			_id = id;
			_width = width;
			_height = height;
			
			if(_player)
			{
				setVideo();
			}
			else
			{
				loadPlayer();
			}
			
			_spinner.x = _width / 2;
			_spinner.y = _height / 2;
		}
		public function stop():void
		{
			if(_player)
			{
				callFunction(FUNCTION_STOP_VIDEO);
			}
		    
		    removeEvents();
		    try
		    {
		    	_loader.close();
		    }
		    catch(error:Error)
		    {
		    	dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
		    }
		}
		public function pause():void
		{
			_paused = true;
			
			if(_player)
			{
				callFunction(FUNCTION_PAUSE_VIDEO);
			}
		}
		public function resume():void
		{
			_paused = false;
			
			if(_player)
			{
				callFunction(FUNCTION_PLAY_VIDEO);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VIDEO
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function loadPlayer():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);
			_loader.load(new URLRequest(URL + _id + VERSION));
		}
		private function setVideo():void
		{
			try
			{
				callFunction(FUNCTION_SET_SIZE, _width, _height);
				callFunction(FUNCTION_SEEK_TO, 0, true);
				callFunction(FUNCTION_PLAY_VIDEO);
				
			    if(_paused)
			    {
			    	pause();
			    }
			}
			catch(error:Error)
			{
				this.dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
			}
		}
		private function callFunction(functionName:String, ...args):void
		{
			(_player[functionName] as Function).apply(null, args);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// HANDLERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private function onLoaderInit(event:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.INIT, onLoaderInit);
			_spinner.disable();
			
			addEvents();
		}
		private function onPlayerReady(event:Event):void
		{
			_player = _loader.content;
			setVideo();
		}
		private function onPlayerError(event:Event):void
		{
		    this.dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
		}
		private function onPlayerStateChange(event:Event):void
		{
			_state = int(event["data"]);
			
			this.dispatchEvent(new Event(Event.CHANGE));
		}
		private function onVideoPlaybackQuality(event:Event):void
		{
			// nothing atm
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _state:int = STATE_UNSTARTED;
		public function get state():int
		{
			return _state;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose(e:Event = null):void
		{
			removeEvents();
			stop();
			
			_loader.close();
			_loader = null;
			
			_spinner.dispose(e);
			_spinner = null;
			
			super.dispose(e);
		}
	}
}