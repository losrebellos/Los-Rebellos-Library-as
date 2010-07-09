package losrebellos.lospistoleros.core.controller.movieclip 
{
	import losrebellos.lospistoleros.core.controller.PController;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.view.IPView;
	import losrebellos.lospistoleros.core.view.movieclip.IPViewMovieClip;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PControllerMovieClip extends PController implements IPControllerMovieClip 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		protected var _model:IPModelMovieClip;
		protected var _view:IPViewMovieClip;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PControllerMovieClip(m:IPModelMovieClip, v:IPViewMovieClip = null, name:String = null)
		{
			super(m, v, name);
		}

		
		/*
		 * 
		 * MVC
		 * 
		 */
		override protected function saveModel(m:IPModel):void
		{
			_model = m as IPModelMovieClip;
		}
		public function setModel(m:IPModelMovieClip):void
		{
			_model = m;
		}
		public function getModel():IPModelMovieClip
		{
			return _model;
		}
		override protected function saveView(v:IPView):void
		{
			_view = v as IPViewMovieClip;
		}
		public function setView(v:IPViewMovieClip):void
		{
			_view = v;
		}
		public function getView():IPViewMovieClip
		{
			return _view;
		}
	}
}