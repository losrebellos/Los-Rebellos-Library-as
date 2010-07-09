package losrebellos.lospistoleros.components.application.movieclip.mouse 
{
	import losrebellos.lospistoleros.components.application.movieclip.base.BasePApplicationControllerMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PMouseApplicationControllerMovieClip extends BasePApplicationControllerMovieClip
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PMouseApplicationControllerMovieClip(m:IPModelMovieClip, v:IPViewMovieClip = null, name:String = null)
		{
			super(m, v, name);
		}
	}
}