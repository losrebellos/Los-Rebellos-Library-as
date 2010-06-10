package losrebellos.media.stream 
{
	import losrebellos.media.Library;
	import losrebellos.states.StreamState;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.ID3Info;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class AudioStream extends Stream implements IStream 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _urlRequest:URLRequest;
		protected var _sound:Sound;
		protected var _soundChannel:SoundChannel;
		protected var _id3:ID3Info;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function AudioStream(id:String, src:String, loop:int = 1, minBuffer:Number = -1)
		{
			super(id, src, loop, minBuffer);
		}
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		override protected function createStream():void
		{
			_urlRequest = new URLRequest(_src);
			_sound = new Sound();
			
			_sound.addEventListener(Event.OPEN, openHandler);
			_sound.addEventListener(Event.ID3, id3Handler);
			_sound.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_sound.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			_sound.addEventListener(Event.COMPLETE, completeHandler);
		}
		override protected function getStream():void
		{
			_sound = Library.instance.getItem(_id) as Sound;
		}
		
		
		/*
		 * 
		 * SOUND TRANSFORM
		 * 
		 */
		override public function set soundTransform(value:SoundTransform):void
		{
			_soundChannel.soundTransform = value;
		}
		override public function get soundTransform():SoundTransform
		{
			return _soundChannel.soundTransform;
		}
		
		
		/*
		 * 
		 * DATA
		 * 
		 */
		override public function getPercentLoaded():Number
		{
			return _sound.bytesLoaded / _sound.bytesTotal;
		}
		override public function getPercentPlayed():Number
		{
			if(_sound && _soundChannel && _sound.length > 0)
				return _soundChannel.position / _sound.length;
			
			return 0;
		}
		
		
		/*
		 * 
		 * DURATION
		 * 
		 */
		public function get loadedDuration():Number
		{
			if(_sound && _sound.length > 0)
				return _sound.bytesTotal / (_sound.bytesLoaded / _sound.length);
			
			return 0;
		}
		public function get totalDuration():Number
		{
			if(_sound && _sound.length > 0)
				return _sound.length;
			
			return 0;
		}

		
		/*
		 * 
		 * LOAD
		 * 
		 */
		override public function load():void
		{
			super.load();
			
			_sound.load(_urlRequest);
		}

		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		override public function play(percent:Number = 0, loop:int = 0):void
		{
			super.play(percent, loop);
			
			_soundChannel = _sound.play(_percent * _sound.length, _loop);
			_soundChannel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
		}
		override public function resume():void
		{
			super.resume();
			
			_soundChannel = _sound.play(_percent * _sound.length, _loop);
			_soundChannel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
		}
		override public function pause():void
		{
			super.pause();
			
			_soundChannel.stop();
		}
		override public function stop():void
		{
			super.stop();
			
			_soundChannel.stop();
			_sound.close();
		}
		override public function seek(_percent:Number):void
		{
			super.seek(_percent);
			
			_soundChannel = _sound.play(_percent * _sound.length, _loop);
			_soundChannel.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
			
			if(state == StreamState.PAUSED || state == StreamState.STOPPED)
				_soundChannel.stop();
		}
		
		
		/*
		 * 
		 * NET STATUS
		 * 
		 */
		protected function openHandler(e:Event):void
		{
			streamStart();
		}
		protected function id3Handler(e:Event):void
		{
			_id3 = _sound.id3;
			
			streamInitialized();
		}
		protected function ioErrorHandler(e:Event):void
		{
			streamError(e);
		}
		protected function progressHandler(e:ProgressEvent):void
		{
			streamProgress();
			streamReady();
		}
		protected function completeHandler(e:Event):void
		{
			streamLoaded();
		}
		protected function soundCompleteHandler(e:Event):void
		{
			streamComplete();
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function destroy():void
		{
			super.destroy();
			
			_soundChannel.stop();
			_sound.close();
		}
	}
}