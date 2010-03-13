package losrebellos.lospistoleros.core.model 
{
	import losrebellos.lospistoleros.core.controller.IPController;
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
		protected var view:IPView;
		protected var controller:IPController;

		
		/*
		 * 
		 * MVC
		 * 
		 */
		public function PModelURLLoader()
		{
			super();
		}
		public function setView(v:IPView):void
		{
			view = v;
		}
		public function getView():IPView
		{
			return view;
		}
		public function setController(c:IPController):void
		{
			controller = c;
		}
		public function getController():IPController
		{
			return controller;
		}
	}
}