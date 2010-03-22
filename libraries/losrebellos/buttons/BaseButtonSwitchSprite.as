package losrebellos.buttons 
{
	import flash.events.MouseEvent;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonSwitchSprite extends BaseButtonSprite 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _switch:Boolean = false;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BaseButtonSwitchSprite()
		{
			super();
		}
		
		
		/*
		 * 
		 * HANDLERS
		 * 
		 */
		override protected function clickHandler(e:MouseEvent = null):void
		{
			if(!_switch)
			{
				_switch = true;
				switchOn();
			}
			else
			{
				_switch = false;
				switchOff();
			}
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		protected function switchOn():void
		{
			
		}
		protected function switchOff():void
		{
			
		}
	}
}