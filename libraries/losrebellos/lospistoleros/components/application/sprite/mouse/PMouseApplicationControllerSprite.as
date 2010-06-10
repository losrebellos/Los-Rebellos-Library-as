package losrebellos.lospistoleros.components.application.sprite.mouse 
{
	import losrebellos.lospistoleros.components.application.sprite.base.BasePApplicationControllerSprite;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PMouseApplicationControllerSprite extends BasePApplicationControllerSprite 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PMouseApplicationControllerSprite(m:IPModelSprite, v:IPViewSprite = null, name:String = null)
		{
			super(m, v, name);
		}
	}
}