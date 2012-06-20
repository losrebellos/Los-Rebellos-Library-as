package com.losrebellos.display.invalidate 
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class StageManager 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static const ITEMS:Vector.<IInvalidate> = new Vector.<IInvalidate>();
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STAGE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static var _stage:Stage = null;
		public static function registerStage(object:IInvalidate):void
		{
			if(!_stage && object is DisplayObject)
			{
				(object as DisplayObject).addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			}
		}
		private static function addedToStageHandler(e:Event):void
		{
			var object:DisplayObject = e.target as DisplayObject;
			object.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			if(!_stage)
			{
				_stage = (object as DisplayObject).stage;
				_stage.addEventListener(Event.RENDER, renderHandler);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// ITEMS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function addItem(object:IInvalidate):void
		{
			// null
			if(!object)
			{
				return ;
			}
			
			// avoid duplication
			if(ITEMS.indexOf(object) == -1)
			{
				ITEMS.push(object);
			}
			
			// Stage.invalidate()
			if(!_render)
			{
				_stage.invalidate();
				_render = true;
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// RENDER
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static var _render:Boolean = false;
		private static function renderHandler(e:Event):void
		{
			while(ITEMS.length > 0)
			{
				(ITEMS.pop() as IInvalidate).redraw();
			}
			
			_render = false;
		}
	}
}