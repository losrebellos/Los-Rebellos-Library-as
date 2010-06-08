package losrebellos.buttons 
{
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.FullScreenEvent;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonFullscreenMovieClip extends BaseButtonSwitchMovieClip
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function BaseButtonFullscreenMovieClip()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		
		/*
		 * 
		 * HANDLERS
		 * 
		 */
		private function addedToStageHandler(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			this.addEventListener(Event.REMOVED_FROM_STAGE, removedToStageHandler);
			stage.addEventListener(FullScreenEvent.FULL_SCREEN, fullscreenHandler);
		}
		private function removedToStageHandler(e:Event):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, removedToStageHandler);
			stage.removeEventListener(FullScreenEvent.FULL_SCREEN, fullscreenHandler);
		}
		protected function fullscreenHandler(e:FullScreenEvent):void
		{
			if(e.fullScreen)
			{
				_switch = true;
				switchOnUI();
			}
			else
			{
				_switch = false;
				switchOffUI();
			}
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		override protected function switchOnAction():void
		{
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		override protected function switchOffAction():void
		{
			stage.displayState = StageDisplayState.NORMAL;
		}
	}
}