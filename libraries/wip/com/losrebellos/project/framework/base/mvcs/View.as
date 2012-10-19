package com.losrebellos.project.framework.base.mvcs
{
	import com.losrebellos.display.base.SpritePlus;

	import flash.events.Event;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public class View extends SpritePlus implements IView
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function View()
		{
			super();
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTENT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createContent();
		}
		protected function onRemovedFromStage(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			disposeContent();
		}
		protected function createContent():void
		{
			
		}
		protected function disposeContent():void
		{
			
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// SHOW / HIDE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function show():void
		{
			this.visible = true;
		}
		public function hide():void
		{
			this.visible = false;
		}
	}
}