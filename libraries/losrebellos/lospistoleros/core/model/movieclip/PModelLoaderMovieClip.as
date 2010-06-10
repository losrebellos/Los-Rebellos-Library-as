package losrebellos.lospistoleros.core.model.movieclip 
{
	import losrebellos.lospistoleros.core.controller.movieclip.IPControllerMovieClip;
	import losrebellos.lospistoleros.core.model.PModelLoader;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PModelLoaderMovieClip extends PModelLoader implements IPModelMovieClip
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PModelLoaderMovieClip(name:String = null)
		{
			super(name);
		}

		
		/*
		 * 
		 * MVC
		 * 
		 */
		public function setView(v:IPViewMovieClip):void
		{
			_view = v;
		}
		public function getView():IPViewMovieClip
		{
			return _view as IPViewMovieClip;
		}
		public function setController(c:IPControllerMovieClip):void
		{
			_controller = c;
		}
		public function getController():IPControllerMovieClip
		{
			return _controller as IPControllerMovieClip;
		}
	}
}