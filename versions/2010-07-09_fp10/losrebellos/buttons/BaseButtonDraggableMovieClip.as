package losrebellos.buttons 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonDraggableMovieClip extends AbstractBaseButtonMovieClip 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _dragRect:Rectangle;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BaseButtonDraggableMovieClip()
		{
			super();
		}
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
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
		
		
		/*
		 * 
		 * HANDLERS
		 * 
		 */
		protected function mouseDownHandler(e:MouseEvent = null):void
		{
			_zone.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.addEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
			mouseMoveStartHandler((e && e is Event) ? (new MouseEvent(MouseEvent.MOUSE_UP)) : (e as MouseEvent));
		}
		protected function mouseUpHandler(e:Event = null):void
		{
			_zone.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
			mouseMoveStopHandler((e && e is Event) ? (new MouseEvent(MouseEvent.MOUSE_UP)) : (e as MouseEvent));
		}
		
		
		/*
		 * 
		 * MVT
		 * 
		 */
		protected function mouseMoveStartHandler(e:MouseEvent = null):void
		{
			this.startDrag(false, _dragRect);
		}
		protected function mouseMoveHandler(e:MouseEvent = null):void
		{
			
		}
		protected function mouseMoveStopHandler(e:MouseEvent = null):void
		{
			this.stopDrag();
		}
	}
}
