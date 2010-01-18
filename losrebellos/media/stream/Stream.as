package losrebellos.media.stream 
{	import losrebellos.events.StreamEvent;
	import losrebellos.net.NetStatus;
	import losrebellos.states.StreamState;

	import flash.events.AsyncErrorEvent;
	import flash.events.EventDispatcher;

	/*	 *	 * @author los rebellos	 *	 */	public class Stream extends EventDispatcher implements IStream
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		public var id:String;
		public var src:String;
		protected var __loop:int = 1;
		protected var __loop_counter:int = 0;
		protected var __state:String;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */		public function Stream(_id:String, _src:String, _loop:int = 1)
		{			super();
			
			id = _id;
			src = _src;
			loop = _loop;
			loopCounter = 0;
			state = StreamState.NOT_STARTED;		}
		
		
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
			
		}
		
		
		/*
		 * 
		 * EVENTS & STATES
		 * 
		 */
		protected function playStreamNotFoundNetStatus():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.ERROR, NetStatus.PLAY_STREAM_NOT_FOUND));
		}
		protected function playStart():void
		{
			state = StreamState.PLAYING;
			this.dispatchEvent(new StreamEvent(StreamEvent.PLAY));
		}
		protected function playStopNetStatus():void
		{
			state = StreamState.STOPPED;
			this.dispatchEvent(new StreamEvent(StreamEvent.COMPLETE));
			
			loopCounter++;
			if(loop > 1 && loopCounter < loop)
				seek(0);
		}
		protected function pauseNetStatus():void
		{
			state = StreamState.PAUSED;
			this.dispatchEvent(new StreamEvent(StreamEvent.PAUSE));
		}
		protected function unpauseNetStatus():void
		{
			state = StreamState.PLAYING;
			this.dispatchEvent(new StreamEvent(StreamEvent.PLAY));
		}
		protected function bufferEmptyNetStatus():void
		{
			state = StreamState.BUFFERING;
			this.dispatchEvent(new StreamEvent(StreamEvent.BUFFERING));
		}
		protected function bufferFullNetStatus():void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.BUFFER_FULL));
		}
		
		
		/*
		 * 
		 * ASYNC ERROR
		 * 
		 */
		protected function asyncErrorHandler(e:AsyncErrorEvent):void
		{
			this.dispatchEvent(new StreamEvent(StreamEvent.ERROR, e.type));
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