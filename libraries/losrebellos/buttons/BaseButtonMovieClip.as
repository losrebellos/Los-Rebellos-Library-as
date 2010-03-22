package losrebellos.buttons 
{
	import losrebellos.display.IMovieClipPlus;
	import losrebellos.display.MovieClipPlus;
	import losrebellos.display.SpritePlus;
	import losrebellos.interfaces.IInteraction;
	import losrebellos.interfaces.IMotion;

	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BaseButtonMovieClip extends MovieClipPlus implements IMovieClipPlus, IInteraction, IMotion
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		public var _zone:SpritePlus;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BaseButtonMovieClip()
		{
			super();
			
			this.gotoAndStop(1);
		}
		public function initialize():void
		{
			addEvents();
		}
		public function finalize():void
		{
			removeEvents();
		}
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		protected function addEvents():void
		{
			_zone.buttonMode = _zone.useHandCursor = true;
			_zone.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
			_zone.addEventListener(MouseEvent.ROLL_OUT,rollOutHandler);
			_zone.addEventListener(MouseEvent.CLICK,clickHandler);
		}
		protected function removeEvents():void
		{
			_zone.buttonMode = _zone.useHandCursor = false;
			_zone.removeEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
			_zone.removeEventListener(MouseEvent.ROLL_OUT,rollOutHandler);
			_zone.removeEventListener(MouseEvent.CLICK,clickHandler);
		}
		
		
		/*
		 * 
		 * HANDLERS
		 * 
		 */
		protected function rollOverHandler(e:MouseEvent = null):void
		{
			
		}
		protected function rollOutHandler(e:MouseEvent = null):void
		{
			
		}
		protected function clickHandler(e:MouseEvent = null):void
		{
			
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function dispose(e:Event = null):DisplayObject
		{
			removeEvents();
			return super.dispose();
		}
	}
}