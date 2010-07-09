package losrebellos.lospistoleros.core.application.movieclip 
{
	import losrebellos.lospistoleros.core.controller.movieclip.PControllerMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationControllerMovieClip extends PControllerMovieClip 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationControllerMovieClip(m:IPModelMovieClip, v:IPViewMovieClip = null, name:String = null)
		{
			super(m, v, name);
		}
	}
}