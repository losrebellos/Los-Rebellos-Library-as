package losrebellos.lospistoleros.core.application.movieclip 
{
	import losrebellos.lospistoleros.core.controller.movieclip.PControllerMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.view.IPView;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	import flash.display.LoaderInfo;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationControllerMovieClip extends PControllerMovieClip 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		protected var _loaderInfo:LoaderInfo = null;
		protected var _parameters:Object = null;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationControllerMovieClip(m:IPModelMovieClip, v:IPViewMovieClip = null, name:String = null)
		{
			super(m, v, name);
		}
		
		
		/*
		 * 
		 * VIEW
		 * 
		 */
		override protected function saveView(v:IPView):void
		{
			super.saveView(v);
			
			if(_view.parent)
			{
				_loaderInfo = _view.parent.loaderInfo;
				_parameters = _loaderInfo.parameters;
			}
		}

		
		/*
		 * 
		 * FLASH VARS
		 * 
		 */
		protected function getFlashVars(name:String):Object
		{
			return _view.parent.loaderInfo.parameters[name];
		}
	}
}