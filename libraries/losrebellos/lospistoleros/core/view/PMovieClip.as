package losrebellos.lospistoleros.core.view 
{
	import losrebellos.display.IMovieClipPlus;
	import losrebellos.display.MovieClipPlus;
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.controller.PController;
	import losrebellos.lospistoleros.core.dispatcher.PDispatcher;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.model.PModel;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class PMovieClip extends MovieClipPlus implements IPView, IMovieClipPlus
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _NAME:String = null;
		protected var _model:IPModel;
		protected var _controller:IPController;
		
		
		/*
		 * 
		 * CONTRUCTOR
		 * 
		 */
		public function PMovieClip(name:String = null) {
			super();
			
			_NAME = name;
			
			_model = createModel();
			_controller = createController();
			
			PDispatcher.instance.registerView(this);
		}
		
		
		/*
		 * 
		 * CREATION
		 * 
		 */
		protected function createModel():IPModel
		{
			return new PModel;
		}
		protected function createController():IPController
		{
			return new PController(_model, this);
		}

		
		/*
		 * 
		 * MVC
		 * 
		 */
		public function setModel(m:IPModel):void
		{
			_model = m;
		}
		public function getModel():IPModel
		{
			return _model;
		}
		public function setController(c:IPController):void
		{
			_controller = c;
		}
		public function getController():IPController
		{
			return _controller;
		}
		
		
		/*
		 * 
		 * NAME
		 * 
		 */
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