package losrebellos.buttons 
{
	import flash.events.MouseEvent;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BaseButtonMovieClip extends AbstractBaseButtonMovieClip
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BaseButtonMovieClip()
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
			
			_zone.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);
			_zone.addEventListener(MouseEvent.ROLL_OUT,rollOutHandler);
			_zone.addEventListener(MouseEvent.CLICK,clickHandler);
		}
		override protected function removeEvents():void
		{
			super.removeEvents();
			
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
	}
}