package losrebellos.display 
{
	import losrebellos.console.Console;

	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class ShapePlus extends Shape implements IShapePlus
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		protected var _rect:Rectangle;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function ShapePlus()
		{
			super();
			
			_graphics = this.graphics;
		}
		
		
		/*
		 * 
		 * GRAPHICS
		 * 
		 */
		protected var _graphics:Graphics;
		public function get g():Graphics
		{
			return _graphics;
		}
		
		
		/*
		 * 
		 * SETTER & GETTER
		 * 
		 */
		public function set scale(value:Number):void
		{
			this.scaleX = this.scaleY = value;
		}
		public function get scale():Number
		{
			return (this.scaleX + this.scaleY) / 2;
		}
		public function set index(value:int):void
		{
			this.setIndex(value);
		}
		public function get index():int
		{
			return this.getIndex();
		}

		
		/*
		 * 
		 * INDEX & CHILDREN UTILS
		 * 
		 */
		protected function setIndex(value : int):Boolean
		{
			if(parent)
			{
				parent.setChildIndex(this, value);
				return true;
			}
			else
			{
				Console.output(this, "setIndex:");
				Console.output("", "- parent: " + parent);
				Console.output("", "");
			}
			return false;
		}
		protected function getIndex():int
		{
			if(parent)
				return parent.getChildIndex(this);
			else
			{
				Console.output(this, "getIndex:");
				Console.output("", "- parent: " + parent);
				Console.output("", "");
			}
			return -1;
		}
		public function setTopIndex():int
		{
			if(parent)
			{
				parent.setChildIndex(this, parent.numChildren - 1);
				return parent.numChildren - 1;
			}
			else
			{
				Console.output(this, "setTopIndex:");
				Console.output("", "- parent: " + parent);
				Console.output("", "");
			}
			return -1;
		}
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function dispose(e:Event = null):DisplayObject
		{
			if(parent)
				return parent.removeChild(this);
			else
			{
				Console.output(this, "dispose:");
				Console.output("", "- parent: " + parent);
				Console.output("", "- event: " + e);
				Console.output("", "");
			}
			return null;
		}
		public function get managedStage():Stage
		{
			return StageManager.getStage();
		}
		
		
		/*
		 * 
		 * POSITION
		 * 
		 */
		public function position(point:Point):void
		{
			this.x = point.x;
			this.y = point.y;
		}
		
		
		/*
		 * 
		 * RESIZE
		 * 
		 */
		public function resize(rect:Rectangle):void
		{
			_rect = rect;
		}
		public function forceResize():Boolean
		{
			if(_rect)
			{
				resize(_rect);
				
				return true;
			}
			
			return false;
		}
	}
}