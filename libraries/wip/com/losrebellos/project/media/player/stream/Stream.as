package com.losrebellos.project.media.player.stream 
{
	import com.losrebellos.constants.states.NetStatusState;
	import com.losrebellos.events.EventDispatcherPlus;
	import com.losrebellos.project.media.player.events.StreamEvent;
	import com.losrebellos.project.media.player.state.StreamState;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.SoundTransform;




	/*	 *	 * @author los rebellos	 *	 */	public class Stream extends EventDispatcherPlus implements IStream
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////		public function Stream(id:String, src:String, loop:int = 1, minBuffer:Number = -1)
		{			super();
			
			_id = id;
			_src = src;
			
			if(_loop > -1)
			{
				_loop = loop;
			}
			_loopCounter = 0;
			
			minBuffering = minBuffer;
			
			_state = StreamState.NOT_STARTED;
			
			// stream
			createStream();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STREAM
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _stream:EventDispatcher;
		protected function createStream():void
		{
			
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROGRESS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function getPercentLoaded():Number
		{
			return -1;
		}
		public function getPercentPlayed():Number
		{
			return -1;
		}
		public function getPercentReady():Number
		{
			var percentReady:Number = getPercentLoaded() / minBuffering;
			if(isNaN(percentReady))
			{
				return 0;
			}
			
			return (percentReady > 1) ? 1 : percentReady;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// ID & SRC
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _id:String;
		public function set id(value:String):void
		{
			_id = value;
		}
		public function get id():String
		{
			return _id;
		}
		protected var _src:String;
		public function set src(value:String):void
		{
			_src = value;
		}
		public function get src():String
		{
			return _src;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _state:String;
		public function set state(value:String):void
		{
			_state = value;
		}
		public function get state():String
		{
			return _state;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOOP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _loop:int = 1;
		public function set loop(value:int):void
		{
			if(_loop > -1)
			{
				_loop = value;
			}
		}
		public function get loop():int
		{
			return _loop;
		}
		protected var _loopCounter:int = 0;
		public function set loopCounter(value:int):void
		{
			_loopCounter = value;
		}
		public function get loopCounter():int
		{
			return _loopCounter;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SOUND TRANSFORM
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set soundTransform(value:SoundTransform):void
		{
			
		}
		public function get soundTransform():SoundTransform
		{
			return null;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOAD
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _minBuffering:Number;
		public function set minBuffering(value:Number):void
		{
			_minBuffering = value;
		}
		public function get minBuffering():Number
		{
			return _minBuffering;
		}
		public function load():void
		{
			_state = StreamState.STOPPED;
		}
		public function unLoad():void
		{
			_state = StreamState.STOPPED;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTROLS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _percent:Number = 0;
		public function play(percent:Number = 0, loop:int = 1):void
		{
			_percent = percent;
			if(loop != 0)
			{
				_loop = loop;
			}
			
			_state = StreamState.PLAYING;
		}
		public function resume():void
		{
			_state = StreamState.PLAYING;
		}
		public function pause():void
		{
			_state = StreamState.PAUSED;
		}
		public function stop():void
		{
			_state = StreamState.STOPPED;
		}
		public function seek(percent:Number):void
		{
			_percent = percent;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STATES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function streamNotFound():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.ERROR, NetStatusState.PLAY_STREAM_NOT_FOUND));
		}
		protected function streamProgress():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.PROGRESS, this.getPercentLoaded()));
		}
		private var _streamReadySend:Boolean = false;
		protected function streamReady():void
		{
			if(getPercentLoaded() > minBuffering && !_streamReadySend)
			{
				_streamReadySend = true;
				
				this.dispatchEvent(new StreamEvent(StreamEvent.READY));
			}
		}
		protected function streamLoaded():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.COMPLETE));
		}
		protected function streamStart():void
		{
			_state = StreamState.PLAYING;
			
			this.dispatchEvent(new StreamEvent(StreamEvent.PLAY));
		}
		protected function streamComplete():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.STREAM_COMPLETE));
			
			_loopCounter++;
			if(_loop == -1 || (_loop >= 1 && _loopCounter < _loop))
			{
				seek(0);
			}
		}
		protected function streamPaused():void
		{
			_state = StreamState.PAUSED;
			this.dispatchEvent(new StreamEvent(StreamEvent.PAUSE));
		}
		protected function streamResume():void
		{
			_state = StreamState.PLAYING;
			this.dispatchEvent(new StreamEvent(StreamEvent.PLAY));
		}
		protected function streamBufferEmpty():void
		{
			_state = StreamState.BUFFERING;
			this.dispatchEvent(new StreamEvent(StreamEvent.BUFFERING));
		}
		protected function streamBufferFull():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.BUFFER_FULL));
		}
		protected function streamError(e:Event):void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.ERROR, e.type));
		}
		protected function streamInitialized():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.STREAM_INITIALIZED));
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected const PROGRESS:Shape = new Shape();
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			if(type == Event.ENTER_FRAME)
			{
				PROGRESS.addEventListener(type, listener, useCapture, priority, useWeakReference);
			}
			else
			{
				super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			}
		}
		override public function hasEventListener(type:String):Boolean
		{
			return (type == Event.ENTER_FRAME) ?
						PROGRESS.hasEventListener(type) :
						super.hasEventListener(type);
		}
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			if(type == Event.ENTER_FRAME)
			{
				PROGRESS.removeEventListener(type, listener, useCapture);
			}
			else
			{
				super.removeEventListener(type, listener, useCapture);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose(e:Event = null):void
		{
			stop();
			
			_stream = null;
			_loopCounter = 0;
		}
	}}