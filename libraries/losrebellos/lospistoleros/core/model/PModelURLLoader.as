package losrebellos.lospistoleros.core.model 
{
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.dispatcher.PDispatcher;
	import losrebellos.lospistoleros.core.view.IPView;
	import losrebellos.net.URLLoaderPlus;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class PModelURLLoader extends URLLoaderPlus implements IPModelURLLoader 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _NAME:String = null;
		protected var _view:IPView;
		protected var _controller:IPController;

		
		/*
		 * 
		 * MVC
		 * 
		 */
		public function PModelURLLoader(name:String = null)
		{
			super();
			
			_NAME = name;
			
			PDispatcher.instance.registerModel(this);
		}
		public function setView(v:IPView):void
		{
			_view = v;
		}
		public function getView():IPView
		{
			return _view;
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
	}
}