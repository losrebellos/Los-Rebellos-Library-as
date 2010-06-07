package losrebellos.lospistoleros.components.application 
{
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.view.PSprite;

	import com.pixelbreaker.ui.osx.MacMouseWheel;

	import flash.events.Event;
	import flash.geom.Rectangle;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class PSimpleApplicationMovieClip extends PSprite 
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function PSimpleApplicationMovieClip()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		protected function addedToStage(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			
			initMouseWheel();
			initStage();
			createStageContent();
			addStageContent();
			resizeHandler();
		}
		
		
		/*
		 * 
		 * MVC
		 * 
		 */
		override protected function createModel():IPModel
		{
			return new PSimpleApplicationModel;
		}
		override protected function createController():IPController
		{
			return new PSimpleApplicationController(_model, this);
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
		protected function initMouseWheel():void
		{
			MacMouseWheel.setup(stage);
		}
		protected function initStage():void
		{
			var m:PSimpleApplicationModel = _model as PSimpleApplicationModel;
			stage.scaleMode = m.getStage().scale;
			stage.align = m.getStage().align;
			stage.quality = m.getStage().quality;
			stage.addEventListener(Event.RESIZE,resizeHandler);
		}
		protected function resizeHandler(e:Event = null):void
		{
			resize(new Rectangle(0, 0, stage.stageWidth, stage.stageHeight));
		}
	}
}