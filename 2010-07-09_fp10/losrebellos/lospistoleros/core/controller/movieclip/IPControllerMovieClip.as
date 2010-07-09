package losrebellos.lospistoleros.core.controller.movieclip 
{
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPControllerMovieClip extends IPController
	{
		function setModel(m:IPModelMovieClip):void;
		function getModel():IPModelMovieClip;
		
		function setView(v:IPViewMovieClip):void;
		function getView():IPViewMovieClip;
	}
}