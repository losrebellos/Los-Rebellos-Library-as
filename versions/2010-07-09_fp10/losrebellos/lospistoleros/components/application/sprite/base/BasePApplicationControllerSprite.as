package losrebellos.lospistoleros.components.application.sprite.base 
{
	import losrebellos.lospistoleros.core.application.sprite.AbstractPApplicationControllerSprite;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BasePApplicationControllerSprite extends AbstractPApplicationControllerSprite
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BasePApplicationControllerSprite(m:IPModelSprite, v:IPViewSprite = null, name:String = null)
		{
			super(m, v, name);
		}
	}
}