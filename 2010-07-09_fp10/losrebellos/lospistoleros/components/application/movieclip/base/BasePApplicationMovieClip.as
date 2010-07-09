package losrebellos.lospistoleros.components.application.movieclip.base 
{
	import losrebellos.lospistoleros.core.application.movieclip.AbstractPApplicationMovieClip;
	import losrebellos.lospistoleros.core.controller.movieclip.IPControllerMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;

	import flash.events.Event;
	import flash.geom.Rectangle;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BasePApplicationMovieClip extends AbstractPApplicationMovieClip 
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BasePApplicationMovieClip(name:String = null)
		{
			super(name);
		}
		
		
		/*
		 * 
		 * MVC
		 * 
		 */
		override protected function createModel():IPModelMovieClip
		{
			return new BasePApplicationModelMovieClip();
		}
		override protected function createController():IPControllerMovieClip
		{
			return new BasePApplicationControllerMovieClip(_model, this);
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		override protected function initStage():void
		{
			super.initStage();
			
			var m:BasePApplicationModelMovieClip = _model as BasePApplicationModelMovieClip;
			stage.scaleMode = m.getStageVO().scale;
			stage.align = m.getStageVO().align;
			stage.quality = m.getStageVO().quality;
			stage.addEventListener(Event.RESIZE,resizeHandler);
		}
		override protected function resizeHandler(e:Event = null):void
		{
			super.resizeHandler(e);
			
			resize(new Rectangle(0, 0, stage.stageWidth, stage.stageHeight));
		}
		
		
		/*
		 * 
		 * CONTROLLER
		 * 
		 */
		override protected function initController():void
		{
			super.initController();
			
			_controller.initialize();
		}
	}
}