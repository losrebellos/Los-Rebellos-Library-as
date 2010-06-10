package losrebellos.lospistoleros.components.application.movieclip.base 
{
	import losrebellos.lospistoleros.core.application.movieclip.AbstractPApplicationModelMovieClip;
	import losrebellos.lospistoleros.vo.StageVO;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BasePApplicationModelMovieClip extends AbstractPApplicationModelMovieClip
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
		public function BasePApplicationModelMovieClip(name:String = null)
		{
			super(name);
		}
		
		
		/*
		 * 
		 * STAGE
		 * 
		 */
		override public function getStageVO():StageVO
		{
			return _stageVO;
		}
	}
}