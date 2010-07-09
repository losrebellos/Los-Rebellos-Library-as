package losrebellos.lospistoleros.core.application.sprite 
{
	import losrebellos.lospistoleros.core.view.sprite.PSprite;

	import flash.events.Event;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationSprite extends PSprite 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationSprite(name:String = null)
		{
			super(name);
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		protected function addedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			initStage();
			createStageContent();
			addStageContent();
			resizeHandler();
			
			initController();
		}
		
		
		/*
		 * 
		 * CONTENT
		 * 
		 */
		protected function createStageContent():void
		{
			
		}
		protected function addStageContent():void
		{
			
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		protected function initStage():void
		{
			
		}
		protected function resizeHandler(e:Event = null):void
		{
			
		}
		
		
		/*
		 * 
		 * CONTROLLER
		 * 
		 */
		protected function initController():void
		{
			
		}
	}
}