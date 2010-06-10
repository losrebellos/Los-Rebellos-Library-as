package losrebellos.lospistoleros.core.model.movieclip 
{
	import losrebellos.lospistoleros.core.controller.movieclip.IPControllerMovieClip;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPModelMovieClip extends IPModel
	{
		function setView(v:IPViewMovieClip):void;
		function getView():IPViewMovieClip;
		
		function setController(c:IPControllerMovieClip):void;
		function getController():IPControllerMovieClip;
	}
}