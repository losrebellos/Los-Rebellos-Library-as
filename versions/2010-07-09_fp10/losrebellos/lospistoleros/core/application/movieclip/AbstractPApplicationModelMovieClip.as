package losrebellos.lospistoleros.core.application.movieclip 
{
	import losrebellos.lospistoleros.core.application.IAbstractPApplicationModel;
	import losrebellos.lospistoleros.core.model.movieclip.PModelMovieClip;
	import losrebellos.lospistoleros.vo.StageVO;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationModelMovieClip extends PModelMovieClip implements IAbstractPApplicationModel
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationModelMovieClip(name:String = null)
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