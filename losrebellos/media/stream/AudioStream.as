package losrebellos.media.stream 
{
	import losrebellos.media.Library;
	import losrebellos.media.stream.IStream;
	import losrebellos.media.stream.Stream;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.media.ID3Info;
	import flash.media.Sound;
	import flash.media.SoundChannel;
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
		private var url_request:URLRequest;
		private var sound:Sound;
		private var sound_channel:SoundChannel;
		private var id3:ID3Info;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function AudioStream(_id:String, _src:String, _loop:int = 1, _min_buffering:Number = -1)
		{
			super(_id, _src, _loop, _min_buffering);
		}
		
		
		/*
		 * 
		 * STREAM
		 * 
		 */
		override protected function createStream():void
		{
			url_request = new URLRequest(src);
			sound = new Sound();
			
			sound.addEventListener(Event.OPEN, openHandler);
			sound.addEventListener(Event.ID3, id3Handler);
			sound.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			sound.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			sound.addEventListener(Event.COMPLETE, completeHandler);
			sound.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
		}
		override protected function getStream():void
		{
			sound = Library.instance.getItem(id) as Sound;
		}
		
		
		/*
		 * 
		 * DATA
		 * 
		 */
		override public function getPercentLoaded():Number
		{
			return sound.bytesLoaded / sound.bytesTotal;
		}
		override public function getPercentPlayed():Number
		{
			if(sound && sound_channel && sound.length > 0)
				return sound_channel.position / sound.length;
			
			return -1;
		}
		
		
		/*
		 * 
		 * DURATION
		 * 
		 */
		public function get loadedDuration():Number
		{
			if(sound && sound.length > 0)
				return sound.bytesTotal / (sound.bytesLoaded / sound.length);
			
			return -1;
		}
		public function get totalDuration():Number
		{
			if(sound && sound.length > 0)
				return sound.length;
			
			return -1;
		}

		
		/*
		 * 
		 * CONTROLS
		 * 
		 */
		override public function load():void
		{
			super.load();
			
			sound.load(url_request);
		}
		override public function play(_percent:Number = 0, _loop:int = -1):void
		{
			super.play(_percent, _loop);
			
			sound_channel = sound.play(_percent * sound.length, loop);
		}
		override public function resume():void
		{
			super.resume();
			
			sound_channel = sound.play(percent * sound.length, loop);
		}
		override public function pause():void
		{
			super.pause();
			
			sound_channel.stop();
		}
		override public function stop():void
		{
			super.stop();
			
			sound_channel.stop();
			sound.close();
		}
		override public function seek(_percent:Number):void
		{
			super.seek(_percent);
			
			sound_channel = sound.play(percent * sound.length, loop);
			sound_channel.stop();
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
			id3 = sound.id3;
			
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
			
			sound_channel.stop();
			sound.close();
		}
	}
}