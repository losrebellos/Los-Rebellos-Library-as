package com.losrebellos.display.loader 
{
	import com.losrebellos.display.invalidate.IInvalidate;
	import com.losrebellos.display.invalidate.StageManager;
	import com.losrebellos.interfaces.IDisposable;

	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;






	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class LoaderPlus extends Loader implements IloaderPlus
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function LoaderPlus()
		{
			super();
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
		// INTERACTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function set mouse(value:Boolean):void
		{
			this.mouseEnabled = this.mouseChildren = value;
		}
		public function get mouse():Boolean
		{
			return !this.mouseEnabled && !this.mouseChildren;
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
		// CHILDREN
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function get children():Vector.<DisplayObject>
		{
			var children:Vector.<DisplayObject> = new Vector.<DisplayObject>();
			var childrenLength:int = this.numChildren;
			
			for(var i:int = 0; i<childrenLength; i++)
			{
				children.push(this.getChildAt(i));
			}
			
			children.fixed = true;
			return children;
		}
		public function applyChildren(Clazz:Class, method:String, ...args):void
		{
			var l:int = this.numChildren;
			var child:DisplayObject;
			while(0 < l--)
			{
				child = getChildAt(l);
				if(child is Clazz)
				{
					(child[method] as Function).apply(null, args);
				}
			}
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
		}
		public function disposeChildren(e:Event = null):void
		{
			applyChildren(IDisposable, "dispose", e);
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
		public function resizeChildren():void
		{
			applyChildren(IInvalidate, "resize");
		}
		public function render():void
		{
			
		}
		public function renderChildren():void
		{
			applyChildren(IInvalidate, "render");
		}
	}
}