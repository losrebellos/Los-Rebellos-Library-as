package losrebellos.lospistoleros.components.application.movieclip.mouse 
{
	import losrebellos.lospistoleros.components.application.movieclip.base.BasePApplicationMovieClip;
	import losrebellos.lospistoleros.core.controller.movieclip.IPControllerMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;

	import com.pixelbreaker.ui.osx.MacMouseWheel;

	import flash.events.Event;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PMouseApplicationMovieClip extends BasePApplicationMovieClip
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PMouseApplicationMovieClip(name:String = null)
		{
			super(name);
		}
		override protected function addedToStage(e:Event):void
		{
			super.addedToStage(e);
			
			initMouseWheel();
		}
		
		
		/*
		 * 
		 * MVC
		 * 
		 */
		override protected function createModel():IPModelMovieClip
		{
			return new PMouseApplicationModelMovieClip();
		}
		override protected function createController():IPControllerMovieClip
		{
			return new PMouseApplicationControllerMovieClip(_model, this);
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
	}
}