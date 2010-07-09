package losrebellos.lospistoleros.components.application.sprite.base 
{
	import losrebellos.lospistoleros.core.application.sprite.AbstractPApplicationSprite;
	import losrebellos.lospistoleros.core.controller.sprite.IPControllerSprite;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;

	import flash.events.Event;
	import flash.geom.Rectangle;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BasePApplicationSprite extends AbstractPApplicationSprite 
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BasePApplicationSprite(name:String = null)
		{
			super(name);
		}
		
		
		/*
		 * 
		 * MVC
		 * 
		 */
		override protected function createModel():IPModelSprite
		{
			return new BasePApplicationModelSprite();
		}
		override protected function createController():IPControllerSprite
		{
			return new BasePApplicationControllerSprite(_model, this);
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		override protected function initStage():void
		{
			super.initStage();
			
			var m:BasePApplicationModelSprite = _model as BasePApplicationModelSprite;
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