package losrebellos.lospistoleros.core.model {	import losrebellos.display.LoaderPlus;	import losrebellos.lospistoleros.core.controller.IPController;	import losrebellos.lospistoleros.core.view.IPView;	/*	 *	 * @author los rebellos	 *	 */	public class PModelLoader extends LoaderPlus implements IPModelLoader 	{		/*		 * 		 * VARIABLES		 * 		 */		protected var view:IPView;		protected var controller:IPController;				/*		 * 		 * MVC		 * 		 */		public function PModelLoader()		{			super();		}		public function setView(v:IPView):void		{			view = v;		}		public function getView():IPView		{			return view;		}		public function setController(c:IPController):void		{			controller = c;		}		public function getController():IPController		{			return controller;		}	}}