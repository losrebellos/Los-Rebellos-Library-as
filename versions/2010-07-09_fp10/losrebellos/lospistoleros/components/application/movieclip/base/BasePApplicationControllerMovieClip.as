package losrebellos.lospistoleros.components.application.movieclip.base 
{
	import losrebellos.lospistoleros.core.application.movieclip.AbstractPApplicationControllerMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class BasePApplicationControllerMovieClip extends AbstractPApplicationControllerMovieClip
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function BasePApplicationControllerMovieClip(m:IPModelMovieClip, v:IPViewMovieClip = null, name:String = null)
		{
			super(m, v, name);
		}
	}
}