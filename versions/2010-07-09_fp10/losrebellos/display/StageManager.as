package losrebellos.display 
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class StageManager 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		private static var _stage:Stage = null;
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		public static function setStage(value:Stage):void
		{
			_stage = value;
		}
		public static function getStage():Stage
		{
			return _stage;
		}
		
		
		/*
		 * 
		 * REGISTER
		 * 
		 */
		public static function registerStage(d:DisplayObject):void
		{
			if(!_stage)
				d.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		private static function addedToStageHandler(e:Event):void
		{
			var d:DisplayObject = e.currentTarget as DisplayObject;
			d.removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			if(!_stage)
				_stage = d.stage;
		}
	}
}