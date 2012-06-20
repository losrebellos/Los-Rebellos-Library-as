package com.losrebellos.project.media.player.stream 
{
	import com.losrebellos.project.media.player.state.StreamState;

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
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _urlRequest:URLRequest;
		protected var _sound:Sound;
		protected var _soundChannel:SoundChannel;
		protected var _id3:ID3Info;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function AudioStream(id:String, src:String, loop:int = 1, minBuffer:Number = -1)
		{
			super(id, src, loop, minBuffer);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STREAM
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override protected function createStream():void
		{
			_urlRequest = new URLRequest(_src);
			_stream = _sound = new Sound();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SOUND TRANSFORM
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function set soundTransform(value:SoundTransform):void
		{
			_soundChannel.soundTransform = value;
		}
		override public function get soundTransform():SoundTransform
		{
			return _soundChannel.soundTransform;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DATA
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function getPercentLoaded():Number
		{
			return _sound.bytesLoaded / _sound.bytesTotal;
		}
		override public function getPercentPlayed():Number
		{
			if(_sound && _soundChannel && _sound.length > 0)
			{
				return _soundChannel.position / _sound.length;
			}
			
			return 0;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DURATION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get loadedDuration():Number
		{
			if(_sound && _sound.length > 0)
			{
				return _sound.bytesTotal / (_sound.bytesLoaded / _sound.length);
			}
			
			return 0;
		}
		public function get totalDuration():Number
		{
			if(_sound && _sound.length > 0)
			{
				return _sound.length;
			}
			
			return 0;
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOAD
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function load():void
		{
			super.load();
			
			_sound.addEventListener(Event.OPEN, onOpen);
			_sound.addEventListener(Event.ID3, onId3);
			_sound.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_sound.addEventListener(ProgressEvent.PROGRESS, onProgress);
			_sound.addEventListener(Event.COMPLETE, onComplete);
			_sound.load(_urlRequest);
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTROLS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function play(percent:Number = 0, loop:int = 1):void
		{
			super.play(percent, loop);
			
			_soundChannel = _sound.play(_percent * _sound.length, _loop);
			_soundChannel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
		}
		override public function resume():void
		{
			super.resume();
			
			_soundChannel = _sound.play(_percent * _sound.length, _loop);
			_soundChannel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
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
		override public function seek(percent:Number):void
		{
			super.seek(percent);
			
			_soundChannel = _sound.play(percent * _sound.length, _loop);
			_soundChannel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			
			if(state == StreamState.PAUSED || state == StreamState.STOPPED)
			{
				_soundChannel.stop();
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// NET STATUS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function onOpen(e:Event):void
		{
			streamStart();
		}
		protected function onId3(e:Event):void
		{
			_id3 = _sound.id3;
			
			streamInitialized();
		}
		protected function onIOError(e:Event):void
		{
			streamError(e);
		}
		protected function onProgress(e:ProgressEvent):void
		{
			streamProgress();
			streamReady();
		}
		protected function onComplete(e:Event):void
		{
			streamLoaded();
		}
		protected function onSoundComplete(e:Event):void
		{
			streamComplete();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose(e:Event = null):void
		{
			if(PROGRESS.hasEventListener(Event.ENTER_FRAME))
			{
				PROGRESS.removeEventListener(Event.ENTER_FRAME, onProgress);
			}
			
			_soundChannel.stop();
			
			_sound.close();
			_sound = null;
			
			super.dispose(e);
		}
	}
}