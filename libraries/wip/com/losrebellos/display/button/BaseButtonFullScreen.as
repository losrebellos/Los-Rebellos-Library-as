package com.losrebellos.display.button 
{
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.FullScreenEvent;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseButtonFullScreen extends BaseButtonSwitch 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BaseButtonFullScreen()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SETUP
		// when ADDED_TO_STAGE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
			_flag = e.fullScreen;
			
			if(_flag)
			{
				switchOnUI();
			}
			else
			{
				switchOffUI();
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STAGE ACTION
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override protected function switchOnAction():void
		{
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
		override protected function switchOffAction():void
		{
			stage.displayState = StageDisplayState.NORMAL;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose(e:Event = null):void
		{
			stage.removeEventListener(FullScreenEvent.FULL_SCREEN, fullscreenHandler);
			
			super.dispose(e);
		}
	}
}