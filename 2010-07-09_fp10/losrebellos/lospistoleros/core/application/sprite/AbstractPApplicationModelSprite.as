package losrebellos.lospistoleros.core.application.sprite 
{
	import losrebellos.lospistoleros.core.application.IAbstractPApplicationModel;
	import losrebellos.lospistoleros.core.model.sprite.PModelSprite;
	import losrebellos.lospistoleros.vo.StageVO;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationModelSprite extends PModelSprite implements IAbstractPApplicationModel
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationModelSprite(name:String = null)
		{
			super(name);
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		public function getStageVO():StageVO
		{
			return null;
		}
	}
}