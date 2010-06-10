package losrebellos.lospistoleros.core.view.movieclip 
{
	import losrebellos.display.IMovieClipPlus;
	import losrebellos.lospistoleros.core.controller.movieclip.IPControllerMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.view.IPView;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPViewMovieClip extends IPView, IMovieClipPlus 
	{
		function setModel(m:IPModelMovieClip):void;
		function getModel():IPModelMovieClip;
		
		function setController(c:IPControllerMovieClip):void;
		function getController():IPControllerMovieClip;
	}
}