package losrebellos.lospistoleros.core.model.sprite 
{
	import losrebellos.lospistoleros.core.controller.sprite.IPControllerSprite;
	import losrebellos.lospistoleros.core.model.PModel;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PModelSprite extends PModel implements IPModelSprite
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PModelSprite(name:String = null)
		{
			super(name);
		}

		
		/*
		 * 
		 * MVC
		 * 
		 */
		public function setView(v:IPViewSprite):void
		{
			_view = v;
		}
		public function setController(c:IPControllerSprite):void
		{
			_controller = c;
		}
		public function getView():IPViewSprite
		{
			return _view as IPViewSprite;
		}
		public function getController():IPControllerSprite
		{
			return _controller as IPControllerSprite;
		}
	}
}