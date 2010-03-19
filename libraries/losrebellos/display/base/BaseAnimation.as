package losrebellos.display.base 
{
	import losrebellos.display.IMovieClipPlus;
	import losrebellos.display.SpritePlus;
	import losrebellos.events.AnimationEvent;

	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import flash.display.Scene;
	import flash.events.Event;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BaseAnimation extends SpritePlus implements IMovieClipPlus
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		//play function
		protected var num_loop:int = -1;
		protected var current_scene:String = null;
		protected var starting_frame:FrameLabel;
		protected var targeted_frame:FrameLabel;
		
		//general
		protected var frames:Array = [];
		
		//elements
		protected var animation:MovieClip;
		
		
		/*
		 * 
		 * CONTENT
		 * 
		 */
		override protected function createContent():void
		{
			animation.stop();
			
			parseFrames();
		}
		override protected function addContent():void
		{
			this.addChild(animation);
		}
		
		
		/*
		 * 
		 * FRAME
		 * 
		 */
		private function parseFrames():void
		{
			for(var i:int = 0; i<animation.currentLabels.length; i++)
			{
				var frame_label:FrameLabel = animation.currentLabels[i];
				frames[frame_label.frame] = frame_label.name;
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
		public function get currentFrameLabel():FrameLabel
		{
			return new FrameLabel(animation.currentLabel, animation.currentFrame);
		}
		public function getFrameLabel(frame:Object):FrameLabel
		{
			if(frame is String)
				return new FrameLabel(String(frame), frames.indexOf(frame));
				
			return new FrameLabel("", int(frame));
		}
		
		
		/*
		 * 
		 * PLAY
		 * 
		 */
		public function play():void
		{
			this.cleanStop();
			this.startPlayHeadHandler(1, animation.totalFrames, null, -1);
		}
		public function gotoAndPlay(frame:Object, scene:String = null):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(1, animation.totalFrames, scene, -1);
		}
		
		
		/*
		 * 
		 * PLAY BACKWARD
		 * 
		 */
		public function playBackward():void
		{
			this.cleanStop();
			this.startPlayHeadHandler(animation.totalFrames, 1, null, -1);
		}
		public function gotoAndPlayBackward(frame : Object, scene : String = null):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(animation.totalFrames, 1, scene, -1);
		}
		
		
		/*
		 * 
		 * LOOP
		 * 
		 */
		public function loop(loop:int = 1):void
		{
			this.cleanStop();
			this.startPlayHeadHandler(1, animation.totalFrames, null, loop);
		}
		public function gotoAndLoop(frame:Object, scene:String = null, loop:int = 1):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(1, animation.totalFrames, scene, loop);
		}
		
		
		/*
		 * 
		 * LOOP BACKWARD
		 * 
		 */
		public function loopBackward(loop:int = 1):void
		{
			this.cleanStop();
			this.startPlayHeadHandler(animation.totalFrames, 1, null, loop);
		}
		public function gotoAndLoopBackward(frame:Object, scene:String = null, loop:int = 1):void
		{
			this.cleanGotoAndStop(frame, scene);
			this.startPlayHeadHandler(animation.totalFrames, 1, scene, loop);
		}
		
		
		/*
		 * 
		 * PLAY TO
		 * 
		 */
		public function playTo(frame : Object, scene : String = null, loop:int = 1):void
		{
			this.cleanStop();
			this.startPlayHeadHandler(animation.currentFrame, frame, scene, loop);
		}
		public function gotoAndPlayTo(start_frame : Object, end_frame : Object, scene : String = null, loop:int = 1):void
		{
			this.cleanGotoAndStop(start_frame, scene);
			this.startPlayHeadHandler(start_frame, end_frame, scene, loop);
		}
		
		
		/*
		 * 
		 * MOVE HEAD MANAGEMENT
		 * 
		 */
		protected function startPlayHeadHandler(start_frame : Object, end_frame : Object, scene : String = null, loop:int = 1):void
		{
			current_scene = scene;
			num_loop = loop;
			starting_frame = this.getFrameLabel(start_frame);
			targeted_frame = this.getFrameLabel(end_frame);
			
			this.addEventListener(Event.ENTER_FRAME, playHeadHandler);
		}
		protected function playHeadHandler(e:Event):void
		{
			//events
			if(animation.currentFrame == 1)
				this.dispatchEvent(new AnimationEvent(AnimationEvent.FIRST_FRAME));
			if(animation.currentFrame == animation.totalFrames)
				this.dispatchEvent(new AnimationEvent(AnimationEvent.LAST_FRAME));
			if(animation.currentFrame == starting_frame.frame)
				this.dispatchEvent(new AnimationEvent(AnimationEvent.STARTING_FRAME));
			
			//move play head
			if(animation.currentFrame < targeted_frame.frame)
				animation.nextFrame();
			else if(animation.currentFrame > targeted_frame.frame)
				animation.prevFrame();
			else
			{
				this.dispatchEvent(new AnimationEvent(AnimationEvent.ENDING_FRAME));
				
				num_loop--;
				if(num_loop <= 0)
					this.stop();
				else
					this.gotoAndPlayTo(starting_frame, targeted_frame, current_scene, num_loop);
			}
		}
		
		
		/*
		 * 
		 * STOP
		 * 
		 */
		public function gotoAndStop(frame : Object, scene : String = null):void
		{
			cleanGotoAndStop(frame, scene);
			
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
			
			animation.gotoAndStop(frame, scene);
		}
		protected function cleanStop():void
		{
			this.removeEventListener(Event.ENTER_FRAME, playHeadHandler);
			
			animation.stop();
		}
		
		
		/*
		 * 
		 * MOVIECLIP METHODS
		 * 
		 */
		public function get currentLabels():Array
		{
			return animation.currentLabels;
		}
		public function get currentLabel():String
		{
			return animation.currentLabel;
		}
		public function get totalFrames():int
		{
			return animation.totalFrames;
		}
		public function prevScene():void
		{
			animation.prevScene();
		}
		public function addFrameScript(...args):void
		{
			animation.addFrameScript();
		}
		public function nextFrame():void
		{
			animation.nextFrame();
		}
		public function get enabled():Boolean
		{
			return animation.enabled;
		}
		public function get framesLoaded():int
		{
			return animation.framesLoaded;
		}
		public function get scenes():Array
		{
			return animation.scenes;
		}
		public function nextScene():void
		{
			animation.nextScene();
		}
		public function get currentFrame():int
		{
			return animation.currentFrame;
		}
		public function set enabled(value:Boolean):void
		{
			animation.enabled = value;
		}
		public function get currentScene():Scene
		{
			return animation.currentScene;
		}
		public function set trackAsMenu(value:Boolean) : void
		{
			animation.trackAsMenu = value;
		}
		public function get trackAsMenu():Boolean
		{
			return animation.trackAsMenu;
		}
		public function prevFrame():void
		{
			animation.prevFrame();
		}
	}
}