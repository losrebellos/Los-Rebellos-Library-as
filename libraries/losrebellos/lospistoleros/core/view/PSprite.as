package losrebellos.lospistoleros.core.view {	import losrebellos.display.SpritePlus;
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.controller.PController;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.model.PModel;	
	/*	 *	 * @author los rebellos	 *	 */	public class PSprite extends SpritePlus implements IPView	{		/*		 * 		 * VARIABLES		 * 		 */		protected var model:IPModel;		protected var controller:IPController;						/*		 * 		 * CONTRUCTOR		 * 		 */		public function PSprite() {			super();						model = createModel();			controller = createController();		}						/*		 * 		 * CREATION		 * 		 */		protected function createModel():IPModel		{			return new PModel;		}		protected function createController():IPController		{			return new PController(model, this);		}				/*		 * 		 * MVC		 * 		 */		public function setModel(m:IPModel):void		{			model = m;		}		public function getModel():IPModel		{			return model;		}		public function setController(c:IPController):void		{			controller = c;		}		public function getController():IPController		{			return controller;		}						/*		 * 		 * INTERACTIVITY		 * 		 */		public function initialize():void		{					}		public function finalize():void		{					}		public function update():void		{					}						/*		 * 		 * EVENTS		 * 		 */		protected function addEvents():void		{					}		protected function removeEvents():void		{					}	}}