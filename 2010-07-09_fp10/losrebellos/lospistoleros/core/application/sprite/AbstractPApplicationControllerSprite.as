package losrebellos.lospistoleros.core.application.sprite 
{
	import losrebellos.lospistoleros.core.controller.sprite.PControllerSprite;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationControllerSprite extends PControllerSprite 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationControllerSprite(m:IPModelSprite, v:IPViewSprite = null, name:String = null)
		{
			super(m, v, name);
		}
	}
}