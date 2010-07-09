package losrebellos.buttons 
{
	import losrebellos.display.ISpritePlus;
	import losrebellos.display.SpritePlus;
	import losrebellos.interfaces.IInteraction;
	import losrebellos.interfaces.IMotion;

	import flash.display.DisplayObject;
	import flash.events.Event;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class AbstractBaseButtonSprite extends SpritePlus implements ISpritePlus, IInteraction, IMotion
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
		public function AbstractBaseButtonSprite()
		{
			super();
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
			_zone.button = true;
		}
		protected function removeEvents():void
		{
			_zone.button = false;
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