package losrebellos.media.stream 
{	import losrebellos.events.EventDispatcherPlus;
	import losrebellos.events.StreamEvent;
	import losrebellos.media.Library;
	import losrebellos.net.NetStatus;
	import losrebellos.states.StreamState;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.SoundTransform;

	/*	 *	 * @author los rebellos	 *	 */	public class Stream extends EventDispatcherPlus implements IStream
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _id:String;
		protected var _src:String;
		
		public var minBuffering:Number;
		private var _streamReadySend:Boolean = false;
		
		protected var _progress:Sprite = new Sprite();
		protected var _percent:Number = 0;
		protected var _loop:int = 1;
		protected var _loopCounter:int = 0;
		protected var _state:String;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */		public function Stream(id:String, src:String, loop:int = 1, minBuffer:Number = -1)
		{			super();
			
			_id = id;
			_src = src;
			
			if(_loop > -1)
				_loop = loop;
			_loopCounter = 0;
			
			minBuffering = minBuffer;
			
			_state = StreamState.NOT_STARTED;
			
			//if doesn't exist
			if(!Library.instance.hasItem(_id))
			{
				createStream();
				
				//add to the library
				Library.instance.addItem(_id, _src);
			}
			
			//if exists
			else
				getStream();
		}
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		protected function createStream():void
		{
			
		}
		protected function getStream():void
		{
			
		}
		
		
		/*
		 * 
		 * PERCENT
		 * 
		 */
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
				return 0;
			
			return (percentReady > 1) ? 1 : percentReady;
		}
		
		
		/*
		 * 
		 * ID & SRC
		 * 
		 */
		public function set id(value:String):void
		{
			_id = value;
		}
		public function get id():String
		{
			return _id;
		}
		public function set src(value:String):void
		{
			_src = value;
		}
		public function get src():String
		{
			return _src;
		}
		
		
		/*
		 * 
		 * STATE
		 * 
		 */
		public function set state(value:String):void
		{
			_state = value;
		}
		public function get state():String
		{
			return _state;
		}
		
		
		/*
		 * 
		 * LOOP
		 * 
		 */
		public function set loop(value:int):void
		{
			if(_loop > -1)
				_loop = value;
		}
		public function get loop():int
		{
			return _loop;
		}
		public function set loopCounter(value:int):void
		{
			_loopCounter = value;
		}
		public function get loopCounter():int
		{
			return _loopCounter;
		}
		
		
		/*
		 * 
		 * SOUND TRANSFORM
		 * 
		 */
		public function set soundTransform(value:SoundTransform):void
		{
			
		}
		public function get soundTransform():SoundTransform
		{
			return null;
		}
		
		
		/*
		 * 
		 * LOAD
		 * 
		 */
		public function load():void
		{
			_state = StreamState.STOPPED;
		}
		public function unLoad():void
		{
			_state = StreamState.STOPPED;
		}
		
		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		public function play(percent:Number = 0, loop:int = 0):void
		{
			_percent = percent;
			if(loop != 0)
				_loop = loop;
			
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
		
		
		/*
		 * 
		 * STATES
		 * 
		 */
		protected function streamNotFound():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.ERROR, NetStatus.PLAY_STREAM_NOT_FOUND));
		}
		protected function streamProgress():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.PROGRESS, this.getPercentLoaded()));
		}
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
				seek(0);
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
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			if(type == Event.ENTER_FRAME)
				_progress.addEventListener(type, listener, useCapture, priority, useWeakReference);
			else
				super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		override public function hasEventListener(type:String):Boolean
		{
			if(type == Event.ENTER_FRAME)
				return _progress.hasEventListener(type);
			
			return super.hasEventListener(type);
		}
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			if(type == Event.ENTER_FRAME)
				_progress.removeEventListener(type, listener, useCapture);
			else
				super.removeEventListener(type, listener, useCapture);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function destroy():void
		{
			_state = StreamState.STOPPED;
			
			_loopCounter = 0;
		}
	}}