package com.losrebellos.display.animation 
{
	import com.losrebellos.constants.states.AnimationState;
	import com.losrebellos.display.base.SpritePlus;
	import com.losrebellos.events.AnimationEvent;
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import flash.display.Scene;
	import flash.events.Event;

	
	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class MovieClipWrapper extends SpritePlus implements IMovieClipPlus
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function MovieClipWrapper(movieClip:MovieClip)
		{
			_movieClip = movieClip;
			
			super();
			parseFrames();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose(e:Event = null):void
		{
			super.dispose(e);
			
			_movieClip = null;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// MOVIE CLIP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _movieClip:MovieClip;
		public function set movieClip(value:MovieClip):void
		{
			_movieClip = value;
		}
		public function get movieClip():MovieClip
		{
			return _movieClip;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INHERIT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set enabled(value:Boolean):void
		{
			_movieClip.enabled = value;
		}
		public function get enabled():Boolean
		{
			return _movieClip.enabled;
		}
		public function set trackAsMenu(value:Boolean):void
		{
			_movieClip.trackAsMenu = value;
		}
		public function get trackAsMenu():Boolean
		{
			return _movieClip.trackAsMenu;
		}
		public function get currentFrame():int
		{
			return _movieClip.currentFrame;
		}
		public function get totalFrames():int
		{
			return _movieClip.totalFrames;
		}
		public function get framesLoaded():int
		{
			return _movieClip.framesLoaded;
		}
		public function get currentLabel():String
		{
			return _movieClip.currentLabel;
		}
		public function get currentLabels():Array
		{
			return _movieClip.currentLabels;
		}
		public function get currentScene():Scene
		{
			return _movieClip.currentScene;
		}
		public function get scenes():Array
		{
			return _movieClip.scenes;
		}
		public function prevFrame():void
		{
			_movieClip.prevFrame();
		}
		public function nextFrame():void
		{
			_movieClip.nextFrame();
		}
		public function prevScene():void
		{
			_movieClip.nextScene();
		}
		public function nextScene():void
		{
			_movieClip.nextScene();
		}
		public function addFrameScript(...args):void
		{
			_movieClip.addFrameScript(args);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private var _state:String = AnimationState.STOPPED;
		public function get state():String
		{
			return _state;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// FRAMES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var frames:Array = [];
		private function parseFrames():void
		{
			var frameLabel:FrameLabel;
			for(var i:int = 0; i<_movieClip.currentLabels.length; i++)
			{
				frameLabel = _movieClip.currentLabels[i];
				frames[frameLabel.frame] = frameLabel.name;
			}
		}
		public function getFrameByLabel(name:String):int
		{
			return frames.indexOf(name);
		}
		public function getLabelByFrame(frame:int):String
		{
			return frames[frame];
		}
		public function getFrameLabel(frame:Object = null):FrameLabel
		{
			//if frame is undefined, return the current FrameLabel
			if(!frame)
			{
				return new FrameLabel(_movieClip.currentLabel, _movieClip.currentFrame);
			}
			
			//if frame is a String
			if(frame is String)
			{
				return new FrameLabel(String(frame), frames.indexOf(frame));
			}
			
			//if frame is an int
			return new FrameLabel("", int(frame));
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// GOTO
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function goto(frame : Object, scene : String = null):void
		{
			if(_state == AnimationState.PLAYING)
			{
				this.cleanStop();
				this.startPlayHeadHandler(_movieClip.currentFrame, frame, scene, _numLoop);
			}
			else if(_state == AnimationState.STOPPED)
			{
				this.gotoAndStop(frame, scene);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PLAY
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function play():void
		{
			this.cleanStop();
			this.startPlayHeadHandler(1, _movieClip.totalFrames, null, -1);
		}
		public function gotoAndPlay(frame:Object, scene:String = null):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(1, _movieClip.totalFrames, scene, -1);
		}
		// backward
		public function playBackward():void
		{
			this.cleanStop();
			this.startPlayHeadHandler(_movieClip.totalFrames, 1, null, -1);
		}
		public function gotoAndPlayBackward(frame:Object, scene:String = null):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(_movieClip.totalFrames, 1, scene, -1);
		}
		// to
		public function playTo(frame:Object, scene:String = null, loop:int = 1):void
		{
			this.cleanStop();
			this.startPlayHeadHandler(_movieClip.currentFrame, frame, scene, loop);
		}
		public function gotoAndPlayTo(startFrame:Object, endFrame:Object, scene:String = null, loop:int = 1):void
		{
			this.cleanGotoAndStop(startFrame, scene);
			this.startPlayHeadHandler(startFrame, endFrame, scene, loop);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// LOOP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function loop(loop:int = 1):void
		{
			this.cleanStop();
			this.startPlayHeadHandler(1, _movieClip.totalFrames, null, loop);
		}
		public function gotoAndLoop(frame:Object, scene:String = null, loop:int = 1):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(1, _movieClip.totalFrames, scene, loop);
		}
		// backward
		public function loopBackward(loop:int = 1):void
		{
			this.cleanStop();
			this.startPlayHeadHandler(_movieClip.totalFrames, 1, null, loop);
		}
		public function gotoAndLoopBackward(frame:Object, scene:String = null, loop:int = 1):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(_movieClip.totalFrames, 1, scene, loop);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PLAY HEAD MANAGEMENT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _numLoop:int = -1;
		protected var _currentScene:String = null;
		protected var _startingFrame:FrameLabel;
		protected var _targetedFrame:FrameLabel;
		protected function startPlayHeadHandler(startFrame:Object, endFrame:Object, scene:String = null, loop:int = 1):void
		{
			_currentScene = scene;
			_numLoop = loop;
			_startingFrame = this.getFrameLabel(startFrame);
			_targetedFrame = this.getFrameLabel(endFrame);

			this.addEventListener(Event.ENTER_FRAME, playHeadHandler);
		}
		protected function playHeadHandler(e:Event):void
		{
			_state = AnimationState.PLAYING;
			
			//events
			if(_movieClip.currentFrame == 1)
			{
				this.dispatchEvent(new AnimationEvent(AnimationEvent.FIRST_FRAME));
			}
			if(_movieClip.currentFrame == _movieClip.totalFrames)
			{
				this.dispatchEvent(new AnimationEvent(AnimationEvent.LAST_FRAME));
			}
			if(_movieClip.currentFrame == _startingFrame.frame)
			{
				this.dispatchEvent(new AnimationEvent(AnimationEvent.STARTING_FRAME));
			}
			
			//move play head
			if(_movieClip.currentFrame < _targetedFrame.frame)
			{
				_movieClip.nextFrame();
			}
			else if(_movieClip.currentFrame > _targetedFrame.frame)
			{
				_movieClip.prevFrame();
			}
			else
			{
				this.dispatchEvent(new AnimationEvent(AnimationEvent.ENDING_FRAME));
				
				_numLoop--;
				if(_numLoop <= 0)
				{
					this.stop();
				}
				else
				{
					this.gotoAndPlayTo(_startingFrame, _targetedFrame, _currentScene, _numLoop);
				}
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STOP
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function gotoAndStop(frame : Object, scene : String = null):void
		{
			cleanGotoAndStop(frame, scene);
			
			_state = AnimationState.STOPPED;
			
			this.dispatchEvent(new AnimationEvent(AnimationEvent.STOPPED));
		}
		public function stop():void
		{
			cleanStop();
			
			this.dispatchEvent(new AnimationEvent(AnimationEvent.STOPPED));
		}
		protected function cleanGotoAndStop(frame : Object, scene : String = null):void
		{
			this.removeEventListener(Event.ENTER_FRAME, playHeadHandler);
			
			_state = AnimationState.STOPPED;
			
			_movieClip.gotoAndStop(frame, scene);
		}
		protected function cleanStop():void
		{
			this.removeEventListener(Event.ENTER_FRAME, playHeadHandler);
			
			_state = AnimationState.STOPPED;
			
			_movieClip.stop();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// USEFUL FOR STREAMING
		// NEED TO BE TESTED
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function seek(percent:Number):void
		{
			this.goto(int(percent * _movieClip.totalFrames));
		}
		public function getPercentPlayed():Number
		{
			return _movieClip.currentFrame / _movieClip.totalFrames;
		}
	}
}