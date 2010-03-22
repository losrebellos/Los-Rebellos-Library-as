package losrebellos.buttons 
{
	import flash.display.StageDisplayState;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonFullscreenSprite extends BaseButtonSwitchSprite 
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
		 * STAGE
		 * 
		 */
		override protected function switchOn():void
		{
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		override protected function switchOff():void
		{
			stage.displayState = StageDisplayState.NORMAL;
		}
	}
}