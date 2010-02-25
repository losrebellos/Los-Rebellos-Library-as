package losrebellos.display {	import losrebellos.console.Console;	import losrebellos.interfaces.IButton;	import losrebellos.interfaces.IEvent;	import losrebellos.interfaces.IMotion;	import losrebellos.interfaces.IMouse;	import losrebellos.interfaces.IPlus;	import flash.display.DisplayObject;	import flash.display.Sprite;	import flash.events.Event;	import flash.geom.Point;	import flash.geom.Rectangle;	/*	 *	 * @author los rebellos	 *	 */	public class SpritePlus extends Sprite implements ISpritePlus, IPlus, IMotion, IMouse, IButton, IEvent	{				/*		 * 		 * CONSTRUCTOR		 * 		 */		public function SpritePlus() {			super();						createContent();			addContent();		}						/*		 * 		 * CONTENT		 * 		 */		protected function createContent():void		{					}		protected function addContent():void		{					}						/*		 * 		 * MOTION		 * 		 */		public function animateIn():void		{					}		public function animateOut():void		{					}						/*		 * 		 * SETTER & GETTER		 * 		 */		public function set scale(value:Number):void		{			this.scaleX = this.scaleY = value;		}		public function get scale():Number		{			return (this.scaleX + this.scaleY) / 2;		}		public function set index(value:int):void		{			this.setIndex(value);		}		public function get index():int		{			return this.getIndex();		}				/*		 * 		 * INDEX UTILS		 * 		 */		protected function setIndex(value : int):Boolean		{			if(parent)			{				parent.setChildIndex(this, value);				return true;			}			else			{				Console.output(this, "setIndex:");				Console.output("", "- parent: " + parent);				Console.output("", "");			}			return false;		}		protected function getIndex():int		{			if(parent)				return parent.getChildIndex(this);			else			{				Console.output(this, "getIndex:");				Console.output("", "- parent: " + parent);				Console.output("", "");			}			return -1;		}		public function setTopIndex():int		{			if(parent)			{				parent.setChildIndex(this, parent.numChildren - 1);				return parent.numChildren - 1;			}			else			{				Console.output(this, "setTopIndex:");				Console.output("", "- parent: " + parent);				Console.output("", "");			}			return -1;		}						/*		 * 		 * MOUSE		 * 		 */		public function set mouse(value:Boolean):void		{			this.mouseEnabled = this.mouseChildren = value;		}		public function get mouse():Boolean		{			return !this.mouseEnabled && !this.mouseChildren;		}		public function set button(value:Boolean):void		{			this.buttonMode = this.useHandCursor = value;		}		public function get button():Boolean		{			return !this.buttonMode && !this.useHandCursor;		}						/*		 * 		 * EVENTS		 * 		 */		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void		{			super.addEventListener(type, listener, useCapture, priority, true);		}						/*		 * 		 * UTILS		 * 		 */		public function dispose(e:Event = null):DisplayObject		{			if(parent)				return parent.removeChild(this);			else			{				Console.output(this, "dispose:");				Console.output("", "- parent: " + parent);				Console.output("", "- event: " + e);				Console.output("", "");			}			return null;		}		public function removeAllChildren():void		{			while(this.numChildren)				this.removeChildAt(0);		}						/*		 * 		 * POSITION		 * 		 */		public function position(point:Point):void		{			this.x = point.x;			this.y = point.y;		}						/*		 * 		 * RESIZE		 * 		 */		public function resize(rect:Rectangle):void		{					}	}}