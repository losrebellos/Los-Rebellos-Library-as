package losrebellos.lospistoleros.components.application.sprite.mouse 
{
	import losrebellos.lospistoleros.components.application.sprite.base.BasePApplicationSprite;
	import losrebellos.lospistoleros.core.controller.sprite.IPControllerSprite;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;

	import com.pixelbreaker.ui.osx.MacMouseWheel;

	import flash.events.Event;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PMouseApplicationSprite extends BasePApplicationSprite 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PMouseApplicationSprite(name:String = null)
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
		override protected function createModel():IPModelSprite
		{
			return new PMouseApplicationModelSprite();
		}
		override protected function createController():IPControllerSprite
		{
			return new PMouseApplicationControllerSprite(_model, this);
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