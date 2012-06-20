package com.losrebellos.display.button 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonDraggable extends AbstractBaseButton
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BaseButtonDraggable()
		{
			super();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override protected function addEvents():void
		{
			super.addEvents();
			
			_zone.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		override protected function removeEvents():void
		{
			super.removeEvents();
			
			_zone.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// HANDLERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function mouseDownHandler(e:MouseEvent = null):void
		{
			_zone.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
			startDrag(false, _dragRect);
		}
		protected function mouseUpHandler(e:Event = null):void
		{
			_zone.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
			stopDrag();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// MVT & DRAG
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function mouseMoveHandler(e:MouseEvent = null):void
		{
			
		}
		protected var _dragRect:Rectangle;
		override public function startDrag(lockCenter:Boolean = false, bounds:Rectangle = null):void
		{
			super.startDrag(lockCenter, bounds || _dragRect);
		}
	}
}