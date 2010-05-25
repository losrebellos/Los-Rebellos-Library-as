package losrebellos.display {	import losrebellos.console.Console;	import losrebellos.events.AnimationEvent;	import losrebellos.interfaces.IMotion;	import flash.display.DisplayObject;	import flash.display.FrameLabel;	import flash.display.MovieClip;	import flash.display.Stage;	import flash.events.Event;	import flash.geom.Point;	import flash.geom.Rectangle;	/*	 *	 * @author los rebellos	 *	 */	public class MovieClipPlus extends MovieClip implements IMovieClipPlus, IMotion	{		/*		 * 		 * VARIABLES		 * 		 */		//play function		protected var num_loop:int = -1;		protected var current_scene:String = null;		protected var starting_frame:FrameLabel;		protected var targeted_frame:FrameLabel;				//general		protected var frames:Array = [];				/*		 * 		 * CONSTRUCTOR		 * 		 */		public function MovieClipPlus() {			super();						parseFrames();						createContent();			addContent();						StageManager.registerStage(this);		}						/*		 * 		 * CONTENT		 * 		 */		protected function createContent():void		{					}		protected function addContent():void		{					}						/*		 * 		 * MOTION		 * 		 */		public function animateIn():void		{					}		public function animateOut():void		{					}						/*		 * 		 * SETTER & GETTER		 * 		 */		public function set scale(value:Number):void		{			this.scaleX = this.scaleY = value;		}		public function get scale():Number		{			return (this.scaleX + this.scaleY) / 2;		}		public function set index(value:int):void		{			this.setIndex(value);		}		public function get index():int		{			return this.getIndex();		}				/*		 * 		 * INDEX & CHILDREN UTILS		 * 		 */		protected function setIndex(value : int):Boolean		{			if(parent)			{				parent.setChildIndex(this, value);				return true;			}			else			{				Console.output(this, "setIndex:");				Console.output("", "- parent: " + parent);				Console.output("", "");			}			return false;		}		protected function getIndex():int		{			if(parent)				return parent.getChildIndex(this);			else			{				Console.output(this, "getIndex:");				Console.output("", "- parent: " + parent);				Console.output("", "");			}			return -1;		}		public function setTopIndex():int		{			if(parent)			{				parent.setChildIndex(this, parent.numChildren - 1);				return parent.numChildren - 1;			}			else			{				Console.output(this, "setTopIndex:");				Console.output("", "- parent: " + parent);				Console.output("", "");			}			return -1;		}		public function getAllChildren():Array		{			var children:Array = [];			var childrenLength:int = this.numChildren;						for(var i:int = 0; i< childrenLength; i++)				children.push(this.getChildAt(i));						return children;		}		public function removeAllChildren():void		{			while(this.numChildren)				this.removeChildAt(0);		}						/*		 * 		 * MOUSE		 * 		 */		public function set mouse(value:Boolean):void		{			this.mouseEnabled = this.mouseChildren = value;		}		public function get mouse():Boolean		{			return !this.mouseEnabled && !this.mouseChildren;		}		public function set button(value:Boolean):void		{			this.buttonMode = this.useHandCursor = value;		}		public function get button():Boolean		{			return !this.buttonMode && !this.useHandCursor;		}						/*		 * 		 * EVENTS		 * 		 */		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void		{			super.addEventListener(type, listener, useCapture, priority, useWeakReference);		}						/*		 * 		 * UTILS		 * 		 */		public function dispose(e:Event = null):DisplayObject		{			if(parent)			{				this.stop();				return parent.removeChild(this);			}			else			{				Console.output(this, "dispose:");				Console.output("", "- parent: " + parent);				Console.output("", "- event: " + e);				Console.output("", "");			}			return null;		}		public function get managedStage():Stage		{			return StageManager.getStage();		}						/*		 * 		 * POSITION		 * 		 */		public function position(point:Point):void		{			this.x = point.x;			this.y = point.y;		}						/*		 * 		 * RESIZE		 * 		 */		public function resize(rect:Rectangle):void		{					}						/*		 * 		 * FRAME		 * 		 */		private function parseFrames():void		{			for(var i:int = 0; i<this.currentLabels.length; i++)			{				var frame_label:FrameLabel = this.currentLabels[i];				frames[frame_label.frame] = frame_label.name;			}		}		public function getFrameByLabel(name:String):int		{			return frames.indexOf(name);		}		public function getLabelByFrame(frame:int):String		{			return frames[frame];		}		public function getFrameLabel(frame:Object = null):FrameLabel		{			//if frame is undefined, return the current FrameLabel			if(!frame)				return new FrameLabel(this.currentLabel, this.currentFrame);						//if frame is a String			if(frame is String)				return new FrameLabel(String(frame), frames.indexOf(frame));						//if frame is an int			return new FrameLabel("", int(frame));		}						/*		 * 		 * PLAY		 * 		 */		override public function play():void		{			this.cleanStop();			this.startPlayHeadHandler(1, this.totalFrames, null, -1);		}		override public function gotoAndPlay(frame:Object, scene:String = null):void		{			this.cleanGotoAndStop(frame, scene);			this.startPlayHeadHandler(1, this.totalFrames, scene, -1);		}						/*		 * 		 * PLAY BACKWARD		 * 		 */		public function playBackward():void		{			this.cleanStop();			this.startPlayHeadHandler(this.totalFrames, 1, null, -1);		}		public function gotoAndPlayBackward(frame : Object, scene : String = null):void		{			this.cleanGotoAndStop(frame, scene);			this.startPlayHeadHandler(this.totalFrames, 1, scene, -1);		}						/*		 * 		 * LOOP		 * 		 */		public function loop(loop:int = 1):void		{			this.cleanStop();			this.startPlayHeadHandler(1, this.totalFrames, null, loop);		}		public function gotoAndLoop(frame:Object, scene:String = null, loop:int = 1):void		{			this.cleanGotoAndStop(frame, scene);			this.startPlayHeadHandler(1, this.totalFrames, scene, loop);		}						/*		 * 		 * LOOP BACKWARD		 * 		 */		public function loopBackward(loop:int = 1):void		{			this.cleanStop();			this.startPlayHeadHandler(this.totalFrames, 1, null, loop);		}		public function gotoAndLoopBackward(frame:Object, scene:String = null, loop:int = 1):void		{			this.cleanGotoAndStop(frame, scene);			this.startPlayHeadHandler(this.totalFrames, 1, scene, loop);		}						/*		 * 		 * PLAY TO		 * 		 */		public function playTo(frame : Object, scene : String = null, loop:int = 1):void		{			this.cleanStop();			this.startPlayHeadHandler(this.currentFrame, frame, scene, loop);		}		public function gotoAndPlayTo(start_frame : Object, end_frame : Object, scene : String = null, loop:int = 1):void		{			this.cleanGotoAndStop(start_frame, scene);			this.startPlayHeadHandler(start_frame, end_frame, scene, loop);		}						/*		 * 		 * MOVE HEAD MANAGEMENT		 * 		 */		protected function startPlayHeadHandler(start_frame : Object, end_frame : Object, scene : String = null, loop:int = 1):void		{			current_scene = scene;			num_loop = loop;			starting_frame = this.getFrameLabel(start_frame);			targeted_frame = this.getFrameLabel(end_frame);						this.addEventListener(Event.ENTER_FRAME, playHeadHandler);		}		protected function playHeadHandler(e:Event):void		{			//events			if(this.currentFrame == 1)				this.dispatchEvent(new AnimationEvent(AnimationEvent.FIRST_FRAME));			if(this.currentFrame == this.totalFrames)				this.dispatchEvent(new AnimationEvent(AnimationEvent.LAST_FRAME));			if(this.currentFrame == starting_frame.frame)				this.dispatchEvent(new AnimationEvent(AnimationEvent.STARTING_FRAME));						//move play head			if(this.currentFrame < targeted_frame.frame)				this.nextFrame();			else if(this.currentFrame > targeted_frame.frame)				this.prevFrame();			else			{				this.dispatchEvent(new AnimationEvent(AnimationEvent.ENDING_FRAME));								num_loop--;				if(num_loop <= 0)					this.stop();				else					this.gotoAndPlayTo(starting_frame, targeted_frame, current_scene, num_loop);			}		}						/*		 * 		 * STOP		 * 		 */		override public function gotoAndStop(frame : Object, scene : String = null):void		{			cleanGotoAndStop(frame, scene);						this.dispatchEvent(new AnimationEvent(AnimationEvent.STOPPED));		}		override public function stop():void		{			cleanStop();						this.dispatchEvent(new AnimationEvent(AnimationEvent.STOPPED));		}		protected function cleanGotoAndStop(frame : Object, scene : String = null):void		{			this.removeEventListener(Event.ENTER_FRAME, playHeadHandler);						super.gotoAndStop(frame, scene);		}		protected function cleanStop():void		{			this.removeEventListener(Event.ENTER_FRAME, playHeadHandler);						super.stop();		}	}}