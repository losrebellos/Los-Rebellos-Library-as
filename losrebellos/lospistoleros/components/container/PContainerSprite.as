package losrebellos.lospistoleros.components.container {	import losrebellos.lospistoleros.components.application.PApplicationSprite;	import losrebellos.lospistoleros.core.controller.IPController;	import losrebellos.lospistoleros.core.model.IPModel;	import losrebellos.lospistoleros.core.view.PSprite;	import losrebellos.lospistoleros.events.PNavigateEvent;	import flash.events.Event;	/*	 *	 * @author los rebellos	 *	 */	public class PContainerSprite extends PSprite 	{		/*		 * 		 * CONSTRUCTOR		 * 		 * this class is used only for deep linking		 * 1 - it's here since the beginning		 * 2 - consistant inside preloader and contains main		 * 3 - didn't wanted to handle the deep linking inside the preloader		 * 		 */		public function PContainerSprite()		{			super();			//			(model as PContainerModel).initialize();			this.addEventListener(PNavigateEvent.CHANGE, changeHandler);			model.addEventListener(PNavigateEvent.CHANGED, changedHandler);		}						/*		 * 		 * MVC		 * 		 */		override protected function createModel():IPModel		{			return new PContainerModel;		}		override protected function createController():IPController		{			return new PContainerController(model, this);		}						/*		 * 		 * MAIN		 * 		 */		public function addMain(main:PApplicationSprite):void		{			main.addEventListener(Event.ADDED_TO_STAGE, mainAddedToStageHandler);			this.addChild(main);		}		protected function mainAddedToStageHandler(e:Event):void		{			var main:PApplicationSprite = e.currentTarget as PApplicationSprite;			main.removeEventListener(Event.ADDED_TO_STAGE, mainAddedToStageHandler);						(model as PContainerModel).initialize();		}				/*		 * 		 * NAVIGATE		 * 		 */		protected function changeHandler(e:PNavigateEvent):void		{			(model as PContainerModel).setURL(e.url);		}		protected function changedHandler(e:PNavigateEvent):void		{			for(var i:int = 0; i<this.numChildren; i++)				this.getChildAt(i).dispatchEvent(e.clone());		}	}}