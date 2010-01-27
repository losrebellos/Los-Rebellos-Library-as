package losrebellos.buttons {	import losrebellos.display.SpritePlus;	import losrebellos.interfaces.IEvent;	import losrebellos.interfaces.IInteraction;	import losrebellos.interfaces.IMotion;	import losrebellos.interfaces.IMouse;	import losrebellos.interfaces.IPlus;	import flash.display.DisplayObject;	import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;	/*	 *	 * @author los rebellos	 *	 */	public class BaseButtonSprite extends SpritePlus implements IInteraction, IMotion, IPlus, IMouse, IEvent	{		/*		 * 		 * VARIABLES		 * 		 */		public var zone:MovieClip;						/*		 * 		 * CONSTRUCTOR		 * 		 */		public function BaseButtonSprite()		{			super();		}		public function initialize():void		{			addEvents();		}		public function finalize():void		{			removeEvents();		}						/*		 * 		 * EVENTS		 * 		 */		protected function addEvents():void		{			zone.buttonMode = zone.useHandCursor = true;			zone.addEventListener(MouseEvent.ROLL_OVER,rollOverHandler);			zone.addEventListener(MouseEvent.ROLL_OUT,rollOutHandler);			zone.addEventListener(MouseEvent.CLICK,clickHandler);		}		protected function removeEvents():void		{			zone.buttonMode = zone.useHandCursor = false;			zone.removeEventListener(MouseEvent.ROLL_OVER,rollOverHandler);			zone.removeEventListener(MouseEvent.ROLL_OUT,rollOutHandler);			zone.removeEventListener(MouseEvent.CLICK,clickHandler);		}						/*		 * 		 * HANDLERS		 * 		 */		protected function rollOverHandler(e:MouseEvent = null):void		{					}		protected function rollOutHandler(e:MouseEvent = null):void		{					}		protected function clickHandler(e:MouseEvent = null):void		{					}						/*		 * 		 * UTILS		 * 		 */		override public function dispose(e:Event = null):DisplayObject		{			removeEvents();			return super.dispose();		}	}}