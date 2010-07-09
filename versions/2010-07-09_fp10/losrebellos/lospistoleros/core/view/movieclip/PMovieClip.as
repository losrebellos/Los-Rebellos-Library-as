package losrebellos.lospistoleros.core.view.movieclip 
{
	import losrebellos.display.MovieClipPlus;
	import losrebellos.lospistoleros.core.controller.movieclip.IPControllerMovieClip;
	import losrebellos.lospistoleros.core.controller.movieclip.PControllerMovieClip;
	import losrebellos.lospistoleros.core.dispatcher.PDispatcher;
	import losrebellos.lospistoleros.core.model.movieclip.IPModelMovieClip;
	import losrebellos.lospistoleros.core.model.movieclip.PModelMovieClip;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class PMovieClip extends MovieClipPlus implements IPViewMovieClip
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _model:IPModelMovieClip;
		protected var _controller:IPControllerMovieClip;
		
		
		/*
		 * 
		 * CONTRUCTOR
		 * 
		 */
		public function PMovieClip(name:String = null, type:String = null)
		{
			super();
			
			_NAME = name;
			_TYPE = type;
			
			_model = createModel();
			_controller = createController();
			
			PDispatcher.instance.registerView(this);
		}
		
		
		/*
		 * 
		 * CREATION
		 * 
		 */
		protected function createModel():IPModelMovieClip
		{
			return new PModelMovieClip();
		}
		protected function createController():IPControllerMovieClip
		{
			return new PControllerMovieClip(_model, this);
		}

		
		/*
		 * 
		 * MVC
		 * 
		 */
		public function setModel(m:IPModelMovieClip):void
		{
			_model = m;
		}
		public function getModel():IPModelMovieClip
		{
			return _model as IPModelMovieClip;
		}
		public function setController(c:IPControllerMovieClip):void
		{
			_controller = c;
		}
		public function getController():IPControllerMovieClip
		{
			return _controller;
		}
		
		
		/*
		 * 
		 * NAME
		 * 
		 */
		protected var _NAME:String = null;
		public function set NAME(value:String):void
		{
			_NAME = value;
		}
		public function get NAME():String
		{
			return _NAME;
		}
		
		
		/*
		 * 
		 * TYPE
		 * 
		 */
		protected var _TYPE:String = null;
		public function set TYPE(value:String):void
		{
			_TYPE = value;
		}
		public function get TYPE():String
		{
			return _TYPE;
		}
		
		
		/*
		 * 
		 * INTERACTIVITY
		 * 
		 */
		public function initialize():void
		{
			
		}
		public function finalize():void
		{
			
		}
		public function update():void
		{
			
		}
		
		
		/*
		 * 
		 * EVENTS
		 * 
		 */
		protected function addEvents():void
		{
			
		}
		protected function removeEvents():void
		{
			
		}
	}
}