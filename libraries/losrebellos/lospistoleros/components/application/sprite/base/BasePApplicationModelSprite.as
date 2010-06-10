package losrebellos.lospistoleros.components.application.sprite.base 
{
	import losrebellos.lospistoleros.core.application.sprite.AbstractPApplicationModelSprite;
	import losrebellos.lospistoleros.vo.StageVO;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BasePApplicationModelSprite extends AbstractPApplicationModelSprite
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _stageVO:StageVO = StageVO.TOP_LEFT_NO_SCALE_BEST;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function BasePApplicationModelSprite(name:String = null)
		{
			super(name);
		}
		
		
		/*
		 * 
		 * DATA
		 * 
		 */
		override public function getStageVO():StageVO
		{
			return _stageVO;
		}
	}
}