package losrebellos.media.stream 
{	import losrebellos.events.StreamEvent;
	import losrebellos.interfaces.IEvent;
	import losrebellos.media.Library;
	import losrebellos.net.NetStatus;
	import losrebellos.states.StreamState;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/*	 *	 * @author los rebellos	 *	 */	public class Stream extends EventDispatcher implements IStream, IEvent
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		public var id:String;
		public var src:String;
		
		public var min_buffering:Number;
		private var _stream_ready_send:Boolean = false;
		
		protected var progress:Sprite = new Sprite();
		protected var percent:Number = 0;
		protected var __loop:int = 1;
		protected var __loop_counter:int = 0;
		protected var __state:String;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */		public function Stream(_id:String, _src:String, _loop:int = 1, _min_buffering:Number = -1)
		{			super();
			
			id = _id;
			src = _src;
			loop = _loop;
			loopCounter = 0;
			min_buffering = _min_buffering;
			
			state = StreamState.NOT_STARTED;
			
			//if doesn't exist
			if(!Library.instance.hasItem(id))
			{
				createStream();
				
				//add to the library
				Library.instance.addItem(id, src);
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
		
		
		/*
		 * 
		 * STATE
		 * 
		 */
		public function set state(value:String):void
		{
			__state = value;
		}
		public function get state():String
		{
			return __state;
		}
		
		
		/*
		 * 
		 * LOOP
		 * 
		 */
		public function set loop(value:int):void
		{
			if(__loop > -1)
				__loop = value;
		}
		public function get loop():int
		{
			return __loop;
		}
		public function set loopCounter(value:int):void
		{
			__loop_counter = value;
		}
		public function get loopCounter():int
		{
			return __loop_counter;
		}
		
		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		public function load():void
		{
			state = StreamState.STOPPED;
		}
		public function play(_percent:Number = 0, _loop:int = -1):void
		{
			percent = _percent;
			loop = _loop;
			
			state = StreamState.PLAYING;
		}
		public function resume():void
		{
			state = StreamState.PLAYING;
		}
		public function pause():void
		{
			state = StreamState.PAUSED;
		}
		public function stop():void
		{
			state = StreamState.STOPPED;
		}
		public function seek(_percent:Number):void
		{
			percent = _percent;
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
			if(getPercentLoaded() > min_buffering && !_stream_ready_send)
			{
				_stream_ready_send = true;
				this.dispatchEvent(new StreamEvent(StreamEvent.READY));
			}
		}
		protected function streamLoaded():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.COMPLETE));
		}
		protected function streamStart():void
		{
			state = StreamState.PLAYING;
			this.dispatchEvent(new StreamEvent(StreamEvent.PLAY));
		}
		protected function streamComplete():void
		{
			state = StreamState.STOPPED;
			this.dispatchEvent(new StreamEvent(StreamEvent.STREAM_COMPLETE));
			
			loopCounter++;
			if(loop > 1 && loopCounter < loop)
				seek(0);
		}
		protected function streamPaused():void
		{
			state = StreamState.PAUSED;
			this.dispatchEvent(new StreamEvent(StreamEvent.PAUSE));
		}
		protected function streamResume():void
		{
			state = StreamState.PLAYING;
			this.dispatchEvent(new StreamEvent(StreamEvent.PLAY));
		}
		protected function streamBufferEmpty():void
		{
			state = StreamState.BUFFERING;
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
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			if(type == Event.ENTER_FRAME)
				progress.addEventListener(type, listener, useCapture, priority, true);
			else
				super.addEventListener(type, listener, useCapture, priority, true);
		}
		override public function hasEventListener(type:String):Boolean
		{
			if(type == Event.ENTER_FRAME)
				return progress.hasEventListener(type);
			
			return super.hasEventListener(type);
		}
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			if(type == Event.ENTER_FRAME)
				progress.removeEventListener(type, listener, useCapture);
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
			state = StreamState.STOPPED;
			
			loopCounter = 0;
		}
	}}