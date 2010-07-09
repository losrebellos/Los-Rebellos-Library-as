package losrebellos.lospistoleros.core.application.movieclip 
{
	import losrebellos.lospistoleros.core.view.movieclip.PMovieClip;

	import flash.events.Event;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationMovieClip extends PMovieClip 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationMovieClip(name:String = null)
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