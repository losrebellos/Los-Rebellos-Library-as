package losrebellos.buttons 
{
	import flash.display.StageDisplayState;
	import flash.events.MouseEvent;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonFullscreenSprite extends BaseButtonSprite 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function BaseButtonFullscreenSprite()
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
			if(stage.displayState == StageDisplayState.NORMAL)
			{
				fullscreenOn();
			}
			else
			{
				fullscreenOff();
			}
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		protected function fullscreenOn():void
		{
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		protected function fullscreenOff():void
		{
			stage.displayState = StageDisplayState.NORMAL;
		}
	}
}