package losrebellos.media.players 
{
	import losrebellos.display.SpritePlus;
	import losrebellos.events.StreamEvent;
	import losrebellos.media.players.IPlayer;
	import losrebellos.media.stream.IStream;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class Player extends SpritePlus implements IPlayer 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var stream:IStream;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function Player()
		{
			super();
		}
		
		
		/*
		 * 
		 * DATA
		 * 
		 */
		public function get state():String
		{
			return stream.state;
		}
		public function getPercentLoaded():Number
		{
			return stream.getPercentLoaded();
		}
		public function getPercentPlayed():Number
		{
			return stream.getPercentPlayed();
		}

		
		/*
		 * 
		 * LOAD
		 * 
		 */
		public function load(_stream:IStream):void
		{
			stream = _stream;
			stream.addEventListener(StreamEvent.STREAM_INITIALIZED, streamInitializeHandler);
			
			stream.load();
		}
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		protected function streamInitializeHandler(e:StreamEvent):void
		{
			stream.removeEventListener(StreamEvent.STREAM_INITIALIZED, streamInitializeHandler);
			
			setSize();
		}
		protected function setSize():void
		{
			
		}
		
		
		/*
		 * 
		 * EVENT
		 * 
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			stream.addEventListener(type, listener, useCapture, priority, useWeakReference);
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		override public function hasEventListener(type:String):Boolean
		{
			return stream.hasEventListener(type) && super.hasEventListener(type);
		}
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			stream.removeEventListener(type, listener, useCapture);
			super.removeEventListener(type, listener, useCapture);
		}
		
		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		public function play(percent:Number = 0, loop:int = 0):void
		{
			stream.play(percent, loop);
			
			setSize();
		}
		public function resume():void
		{
			stream.resume();
		}
		public function pause():void
		{
			stream.pause();
		}
		public function stop():void
		{
			stream.stop();
		}
		public function seek(percent:Number):void
		{
			stream.seek(percent);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function destroyStream():void
		{
			stream.destroy();
		}
	}
}
