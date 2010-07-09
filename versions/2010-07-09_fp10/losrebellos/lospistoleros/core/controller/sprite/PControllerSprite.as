package losrebellos.lospistoleros.core.controller.sprite 
{
	import losrebellos.lospistoleros.core.controller.PController;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;
	import losrebellos.lospistoleros.core.view.IPView;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class PControllerSprite extends PController implements IPControllerSprite 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		protected var _model:IPModelSprite;
		protected var _view:IPViewSprite;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function PControllerSprite(m:IPModelSprite, v:IPViewSprite = null, name:String = null) 
		{
			super(m, v, name);
		}

		
		/*
		 * 
		 * MVC
		 * 
		 */
		override protected function saveModel(m:IPModel):void
		{
			_model = m as IPModelSprite;
		}
		public function setModel(m:IPModelSprite):void
		{
			_model = m;
		}
		public function getModel():IPModelSprite
		{
			return _model;
		}
		override protected function saveView(v:IPView):void
		{
			_view = v as IPViewSprite;
		}
		public function setView(v:IPViewSprite):void
		{
			_view = v;
		}
		public function getView():IPViewSprite
		{
			return _view;
		}
	}
}