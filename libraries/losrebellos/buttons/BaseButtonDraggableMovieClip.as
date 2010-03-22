package losrebellos.buttons 
{
	import flash.events.Event;
	import flash.events.MouseEvent;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonDraggableMovieClip extends AbstractBaseButtonMovieClip 
	{
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
		}
		protected function mouseUpHandler(e:Event = null):void
		{
			_zone.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
			stage.removeEventListener(Event.MOUSE_LEAVE, mouseUpHandler);
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			
			mouseMoveStopHandler((e && e is Event) ? (new MouseEvent(MouseEvent.MOUSE_UP)) : e);
		}
		
		
		/*
		 * 
		 * MVT
		 * 
		 */
		protected function mouseMoveHandler(e:MouseEvent = null):void
		{
			
		}
		protected function mouseMoveStopHandler(e:MouseEvent = null):void
		{
			
		}
	}
}
