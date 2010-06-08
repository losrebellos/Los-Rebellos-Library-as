package losrebellos.buttons 
{
	import flash.events.MouseEvent;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonSwitchMovieClip extends BaseButtonMovieClip 
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
		public function BaseButtonSwitchMovieClip()
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
				switchOnAction();
				switchOnUI();
			}
			else
			{
				_switch = false;
				switchOffAction();
				switchOffUI();
			}
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		protected function switchOnAction():void
		{
			
		}
		protected function switchOffAction():void
		{
			
		}
		protected function switchOnUI():void
		{
			
		}
		protected function switchOffUI():void
		{
			
		}
	}
}