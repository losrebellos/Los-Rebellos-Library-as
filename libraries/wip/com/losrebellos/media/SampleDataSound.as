package com.losrebellos.media
{
	import com.anttikupila.media.filters.IFilter;
	import com.losrebellos.media.filter.soundtransform.ISoundTransformFilter;
	import flash.events.Event;
	import flash.events.SampleDataEvent;
	import flash.media.ID3Info;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundLoaderContext;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;





	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class SampleDataSound extends Sound implements ISampleDataSound
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		// rates
		public static const SAMPLE_RATE_44100:Number	= 44.1;
		public static const SAMPLE_RATE_22050:Number	= 22.05;
		public static const SAMPLE_RATE_11025:Number	= 11.025;
		public static const SAMPLE_RATE_8000:Number		= 8;
		public static const SAMPLE_RATE_5512:Number		= 5.512;
		
		// bytes
		public static const SAMPLE_BYTES_512:int		= 512;
		public static const SAMPLE_BYTES_1024:int		= 1024;
		public static const SAMPLE_BYTES_2048:int		= 2048;
		public static const SAMPLE_BYTES_4096:int		= 4096;
		public static const SAMPLE_BYTES_8192:int		= 8192;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _sound:Sound;
		private var _soundTransform:SoundTransform;
		
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		// //////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function SampleDataSound(sound:Sound, sampleRate:Number = SAMPLE_RATE_44100, bytesPerCallBack:int = SAMPLE_BYTES_4096)
		{
			super();
			
			_sound = sound;
			_sampleRate = sampleRate;
			_bytesPerCallBack = bytesPerCallBack;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SPEED >= 0
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _speed:Number = 1;
		public function set speed(value:Number):void
		{
			_speed = Math.abs(value);
		}
		public function get speed():Number
		{
			return _speed;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CHANNEL
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _channel:SoundChannel;
		public function get channel():SoundChannel
		{
			return _channel;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTROLS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _startTime:Number;
		override public function play(startTime:Number = 0, loops:int = 0, sndTransform:SoundTransform = null):SoundChannel
		{
			stop();
			
			_startTime = startTime;		// TODO
			_loops = loops;
			_soundTransform = sndTransform;
			_completedLoop = 0;
			_numSamples = int(_sound.length * _sampleRate);
			_phase = 0;
			
			setSoundTransform();
			addEventListener(SampleDataEvent.SAMPLE_DATA, onSampleData);
			
			_channel = super.play(0, 0, _soundTransform);
			_channel.addEventListener(Event.SOUND_COMPLETE, onSoundFinished);
			
			return _channel;
		}
		public function stop():void
		{
			if(_channel)
			{
				removeEventListener(SampleDataEvent.SAMPLE_DATA, onSampleData);
				
				_channel.removeEventListener(Event.SOUND_COMPLETE, onSoundFinished);
				_channel = null;
			}
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
		public function pause():void
		{
			if(_channel)
			{
				removeEventListener(SampleDataEvent.SAMPLE_DATA, onSampleData);
				
				_channel.removeEventListener(Event.SOUND_COMPLETE, onSoundFinished);
				_channel.stop();
				_channel = null;
			}
		}
		public function resume():void
		{
			if(!_channel)
			{
				addEventListener(SampleDataEvent.SAMPLE_DATA, onSampleData);
				
				_channel = super.play(0, 0, _soundTransform);
				_channel.addEventListener(Event.SOUND_COMPLETE, onSoundFinished);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EXTRACT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function extract(target:ByteArray, length:Number, startPosition:Number = -1):Number
		{
			return _sound.extract(target, length, startPosition);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LENGTH
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get progress():Number
		{
			return _phase / _numSamples;
		}
		override public function get length():Number
		{
			return _sound.length;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SAMPLE DATA
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _bytesPerCallBack:int;
		private var _sampleRate:Number;
		private var _phase:Number;
		private var _numSamples:int;
		private function onSampleData(e:SampleDataEvent):void
		{
			var buffer:ByteArray = new ByteArray();
			var startPosition:int = _phase;
			var l:Number;
			var r:Number;
			var p:int;
			
			// extract
			_sound.extract(buffer, int(_bytesPerCallBack * _speed), startPosition);
			
			// bytes
			buffer.position = 0;
			while(buffer.bytesAvailable > 0)
			{
				p = int(_phase - startPosition) * 8;

				if(p < buffer.length - 8 && e.data.length <= _bytesPerCallBack * 8)
				{
					buffer.position = p;

					l = buffer.readFloat();
					r = buffer.readFloat();

					e.data.writeFloat(processFilters(l));
					e.data.writeFloat(processFilters(r));
				}
				else
				{
					buffer.position = buffer.length;
				}

				_phase += _speed;

				// loop
				if(_phase >= _numSamples)
				{
					_phase -= _numSamples;
					break;
				}
			}
			
			// sound channel filters
			processSoundChannelFilters();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOOP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _loops:int;
		private var _completedLoop:int = 0;
		public function get completedLoop():int
		{
			return _completedLoop;
		}
		// sound finished
		private function onSoundFinished(event:Event):void
		{
			_channel.removeEventListener(Event.SOUND_COMPLETE, onSoundFinished);
			
			_completedLoop++;
			if(_loops <= 0 || _completedLoop < _loops)
			{
				play(_startTime, _loops, _soundTransform);
			}
			else
			{
				stop();
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SOUND FILTERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _soundFilters:Vector.<IFilter>;
		public function set filters(value:Vector.<IFilter>):void
		{
			_soundFilters = value;
		}
		private function processFilters(data:Number):Number
		{
			var filter:IFilter;
			for each(filter in _soundFilters)
			{
				data = filter.process(data);
			}
			
			return data;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SOUND CHANNEL FILTERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _channelFilters:Vector.<ISoundTransformFilter>;
		public function set channelFilters(value:Vector.<ISoundTransformFilter>):void
		{
			_channelFilters = value;
			
			setSoundTransform();
		}
		private function setSoundTransform():void
		{
			if(!_soundTransform)
			{
				_soundTransform = new SoundTransform();
			}
			
			var filter:ISoundTransformFilter;
			for each(filter in _channelFilters)
			{
				filter.soundTransform = _soundTransform;
			}
		}
		private function processSoundChannelFilters():void
		{
			if(!_channel)
			{
				return ;
			}
			
			var filter:ISoundTransformFilter;
			for each(filter in _channelFilters)
			{
				filter.process();
			}
			
			_channel.soundTransform = _soundTransform;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DATA
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function get bytesLoaded():uint
		{
			return _sound.bytesLoaded;
		}
		override public function get bytesTotal():int
		{
			return _sound.bytesTotal;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DATA
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function get url():String
		{
			return _sound.url;
		}
		override public function get isURLInaccessible():Boolean
		{
			return _sound.isURLInaccessible;
		}
		override public function get id3():ID3Info
		{
			return _sound.id3;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOADING
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function get isBuffering():Boolean
		{
			return _sound.isBuffering;
		}
		override public function load(stream:URLRequest, context:SoundLoaderContext = null):void
		{
			if(stream && _sound)
			{
				_sound.load(stream, context);
			}
		}
		override public function close():void
		{
			_sound.close();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function dispose(e:Event = null):void
		{
			stop();
			
			_soundTransform = null;
			_soundFilters = null;
			_channelFilters = null;
		}
	}
}