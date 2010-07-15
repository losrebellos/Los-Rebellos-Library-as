package losrebellos.media.players 
{
	import losrebellos.display.SpritePlus;
	import losrebellos.events.StreamEvent;
	import losrebellos.media.stream.IStream;

	import flash.media.SoundTransform;

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
		protected var _stream:IStream;
		
		
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
			return _stream.state;
		}
		public function getPercentLoaded():Number
		{
			return _stream.getPercentLoaded();
		}
		public function getPercentPlayed():Number
		{
			return _stream.getPercentPlayed();
		}
		
		
		/*
		 * 
		 * SOUND TRANSFORM
		 * 
		 */
		public function set streamSoundTransform(value:SoundTransform):void
		{
			_stream.soundTransform = value;
		}
		public function get streamSoundTransform():SoundTransform
		{
			return _stream.soundTransform;
		}

		
		/*
		 * 
		 * LOAD
		 * 
		 */
		public function load(stream:IStream):void
		{
			_stream = stream;
			_stream.addEventListener(StreamEvent.STREAM_INITIALIZED, streamInitializeHandler);
			
			_stream.load();
		}
		public function unLoad():void
		{
			if(_stream)
			{
				_stream.unLoad();
				_stream = null;
			}
		}
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		protected function streamInitializeHandler(e:StreamEvent):void
		{
			_stream.removeEventListener(StreamEvent.STREAM_INITIALIZED, streamInitializeHandler);
			
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
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			if(_stream)
				_stream.addEventListener(type, listener, useCapture, priority, useWeakReference);
			
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		override public function hasEventListener(type:String):Boolean
		{
			return (_stream && _stream.hasEventListener(type)) || super.hasEventListener(type);
		}
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			if(_stream)
				_stream.removeEventListener(type, listener, useCapture);
			
			super.removeEventListener(type, listener, useCapture);
		}
		
		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		public function play(percent:Number = 0, loop:int = 1):void
		{
			_stream.play(percent, loop);
			
			setSize();
		}
		public function resume():void
		{
			_stream.resume();
		}
		public function pause():void
		{
			_stream.pause();
		}
		public function stop():void
		{
			_stream.stop();
		}
		public function seek(percent:Number):void
		{
			_stream.seek(percent);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		public function setStream(value:IStream):void
		{
			_stream = value;
		}
		public function getStream():IStream
		{
			return _stream;
		}
		public function destroyStream():void
		{
			_stream.destroy();
		}
	}
}
