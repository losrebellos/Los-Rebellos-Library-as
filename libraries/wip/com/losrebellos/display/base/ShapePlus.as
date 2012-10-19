package com.losrebellos.display.base 
{
	import com.losrebellos.display.invalidate.StageManager;

	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.Event;




	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class ShapePlus extends Shape implements IShapePlus
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function ShapePlus()
		{
			super();
			
			_graphics = this.graphics;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// GRAPHICS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _graphics:Graphics;
		public function get g():Graphics
		{
			return _graphics;
		}
		public function drawCircle(x:Number = 0, y:Number = 0, radius:Number = 50, color:uint = 0xff0000, alpha:Number = .5):void
		{
			_graphics.beginFill(color, alpha);
			_graphics.drawCircle(x, y, radius);
			_graphics.endFill();
		}
		public function drawRect(x:Number = 0, y:Number = 0, width:Number = 50, height:Number = 50, color:uint = 0xff0000, alpha:Number = .5):void
		{
			_graphics.beginFill(color, alpha);
			_graphics.drawRect(x, y, width, height);
			_graphics.endFill();
		}
		public function drawRoundRect(x:Number = 0, y:Number = 0, width:Number = 50, height:Number = 50, color:uint = 0xff0000, alpha:Number = .5, ellipseWidth:Number = 10, ellipseHeight:Number = undefined):void
		{
			_graphics.beginFill(color, alpha);
			_graphics.drawRoundRect(x, y, width, height, ellipseWidth, ellipseHeight);
			_graphics.endFill();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SCALE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set scale(value:Number):void
		{
			this.scaleX = this.scaleY = value;
		}
		public function get scale():Number
		{
			return (this.scaleX + this.scaleY) / 2;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INDEX
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set index(value:int):void
		{
			this.setIndex(value);
		}
		public function get index():int
		{
			return this.getIndex();
		}
		protected function setIndex(value : int):Boolean
		{
			if(parent)
			{
				parent.setChildIndex(this, value);
				return true;
			}
			
			return false;
		}
		protected function getIndex():int
		{
			return (parent) ? parent.getChildIndex(this) : -1;
		}
		public function setTopIndex():int
		{
			if(parent)
			{
				parent.setChildIndex(this, parent.numChildren - 1);
				return parent.numChildren - 1;
			}
			
			return -1;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// REMOVE / DISPOSE / DESTROY
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function remove(e:Event = null):Boolean
		{
			if(parent)
			{
				parent.removeChild(this);
				
				return true;
			}
			
			return false;
		}
		public function dispose(e:Event = null):void
		{
			remove();
			
			_graphics.clear();
			_graphics = null;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INVALIDATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function invalidate():void
		{
			StageManager.addItem(this);
		}
		public function resize():void
		{
			
		}
		public function render():void
		{
			
		}
	}
}