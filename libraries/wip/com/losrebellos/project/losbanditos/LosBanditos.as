package com.losrebellos.project.losbanditos
{
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.events.Event;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class LosBanditos 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		// rendering type
		public static const TYPE_NORMAL:String				= "LosBanditos/type/normal";
		public static const TYPE_SEQUENCING:String			= "LosBanditos/type/sequencing";
		public static const TYPE_MANUAL_NORMAL:String		= "LosBanditos/type/manual/normal";
		public static const TYPE_MANUAL_SEQUENCING:String	= "LosBanditos/type/manual/sequencing";
		
		// clock
		private static const _CLOCK:Shape = new Shape();
		
		// for sequencing
		private static const _FRAMES_REFRESH:int = 24;
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STAGE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		private static var _stage:Stage;
		public static function set stage(value:Stage):void
		{
			_stage = value;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// USE FRAMES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static var useFrames:Boolean = false;
		private static function convertDuration(time:Number):int
		{
			if(!useFrames)
			{
				return int(time * _stage.frameRate);
			}
			
			return int(time);
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// GENERATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function tween(object:Object, duration:Number, properties:Object, ease:Function = null):void
		{
			// stage
			if(!_stage && object["stage"])
			{
				_stage = object["stage"];
			}
			
			// tween
			LosBanditosLibrary.addTween(object, new LosBanditosTween(object, _t, convertDuration(duration), properties["delay"] ? convertDuration(properties["delay"]) : 0, properties, ease));
			
			//start
			if(LosBanditosLibrary.length == 1)
			{
				start();
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// FORCED UPDATE
		// update all objects
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function update():void
		{
			_renderFunction();
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// START / STOP
		// sequencing is good only when it's over 48fps
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static var _renderType:String = TYPE_NORMAL;
		private static var _renderFunction:Function = null;
		public static function set renderType(value:String):void
		{
			_renderType = value;
			
			// render function
			switch(value)
			{
				case TYPE_MANUAL_SEQUENCING:
					_renderFunction = updateTweensSequencingHandler;
					break;
					
				case TYPE_MANUAL_NORMAL:
					_renderFunction = updateTweensHandler;
					break;
				
				default:
					_renderFunction = null;
					break;
			}
			
			// if manager is running
			if(LosBanditosLibrary.length > 1)
			{
				start();
			}
		}
		private static function start():void
		{
			switch(_renderType)
			{
				case TYPE_SEQUENCING:
					stopNormal();
					startSequencing();
					break;
				
				case TYPE_NORMAL:
					stopSequencing();
					startNormal();
					break;
				
				default:
					stopNormal();
					stopSequencing();
					break;
			}
		}
		private static function stop():void
		{
			stopSequencing();
			stopNormal();
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// NORMAL
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static function startNormal():void
		{
			_CLOCK.addEventListener(Event.ENTER_FRAME, updateTweensHandler);
		}
		private static function stopNormal():void
		{
			_CLOCK.removeEventListener(Event.ENTER_FRAME, updateTweensHandler);
			
			_t = 0;
		}
		private static function updateTweensHandler(e:Event = null):void
		{
			// update all tweens
			var i:int = LosBanditosLibrary.length;
			while(--i>-1)
			{
				if(updateTween(LosBanditosLibrary.getTween(i)))
				{
					LosBanditosLibrary.removeTweenByIndex(i);
				}
			}
			
			// current time
			_t++;
			
			// stop
			if(LosBanditosLibrary.length == 0)
			{
				killAllTweens();
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SEQUENCING
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static function startSequencing():void
		{
			_f = int(_stage.frameRate / _FRAMES_REFRESH);
			
			_CLOCK.addEventListener(Event.ENTER_FRAME, updateTweensSequencingHandler);
		}
		private static function stopSequencing():void
		{
			_CLOCK.removeEventListener(Event.ENTER_FRAME, updateTweensSequencingHandler);
			
			_t = 0;
		}
		private static var _sequencingLoopLength:Number;
		private static var _sequencingStop:int;
		private static var _sequencingInc:int;
		private static function updateTweensSequencingHandler(e:Event = null):void
		{
			// update all tweens
			if(LosBanditosLibrary.length > 20)
			{
				var f:int = _f;
				while(--f>-1)
				{
					if(_t % _f == f)
					{
						_sequencingLoopLength = (LosBanditosLibrary.length - 1) / _f;
						_sequencingStop = int(f * _sequencingLoopLength);
						_sequencingInc = int((f + 1) * _sequencingLoopLength);
						while(--_sequencingInc>_sequencingStop)
						{
							if(updateTween(LosBanditosLibrary.getTween(_sequencingInc)))
							{
								LosBanditosLibrary.removeTweenByIndex(_sequencingInc);
							}
						}
					}
				}
			}
			else
			{
				updateTweensHandler(e);
			}
			
			// current time
			_t++;
			
			// stop
			if(LosBanditosLibrary.length == 0)
			{
				killAllTweens();
			}
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// UPDATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static var _t:int = 0;		// current time
		private static var _f:int = 1;		// refresh frequency for scaling the update calls
		private static function updateTween(_tween:LosBanditosTween):Boolean
		{
			// delay?
			if(_tween.startTime == _t)
			{
				if(_tween.onStart != null)
				{
					_tween.onStart.apply(null, _tween.onStartParams);
					_tween.onStart = null;
				}
			}
			if(_tween.startTime < _t)
			{
				_tween.update(_t - _tween.startTime);
				
				if(_tween.onUpdate != null)
				{
					_tween.onUpdate.apply(null, _tween.onUpdateParams);
				}
			}
			
			// remove finished tween
			if(_tween.endTime < _t)
			{
				_tween.update(_tween.duration);
				if(_tween.onComplete != null)
				{
					_tween.onComplete.apply(null, _tween.onCompleteParams);
				}
				_tween = null;
				
				return true;
			}
			
			return false;
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTROLS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function pauseAll():void
		{
			stop();
		}
		public static function resumeAll():void
		{
			start();
		}
		public static function killAllTweens():void
		{
			stop();
			
			LosBanditosLibrary.empty();
		}
		public static function killTweens(object:Object):Boolean
		{
			return LosBanditosLibrary.removeTweenByObject(object);
		}
	}
}