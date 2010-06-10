package losrebellos.lospistoleros.core.view.sprite {	import losrebellos.display.SpritePlus;	import losrebellos.lospistoleros.core.controller.sprite.IPControllerSprite;	import losrebellos.lospistoleros.core.controller.sprite.PControllerSprite;	import losrebellos.lospistoleros.core.dispatcher.PDispatcher;	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;	import losrebellos.lospistoleros.core.model.sprite.PModelSprite;	/*	 *	 * @author los rebellos	 *	 */	public class PSprite extends SpritePlus implements IPViewSprite	{		/*		 * 		 * VARIABLES		 * 		 */		protected var _model:IPModelSprite;		protected var _controller:IPControllerSprite;						/*		 * 		 * CONTRUCTOR		 * 		 */		public function PSprite(name:String = null, type:String = null)		{			super();						_NAME = name;			_TYPE = type;						_model = createModel();			_controller = createController();						PDispatcher.instance.registerView(this);		}						/*		 * 		 * CREATION		 * 		 */		protected function createModel():IPModelSprite		{			return new PModelSprite();		}		protected function createController():IPControllerSprite		{			return new PControllerSprite(_model, this);		}				/*		 * 		 * MVC		 * 		 */		public function setModel(m:IPModelSprite):void		{			_model = m;		}		public function getModel():IPModelSprite		{			return _model;		}		public function setController(c:IPControllerSprite):void		{			_controller = c;		}		public function getController():IPControllerSprite		{			return _controller;		}						/*		 * 		 * NAME		 * 		 */		protected var _NAME:String = null;		public function set NAME(value:String):void		{			_NAME = value;		}		public function get NAME():String		{			return _NAME;		}						/*		 * 		 * TYPE		 * 		 */		protected var _TYPE:String = null;		public function set TYPE(value:String):void		{			_TYPE = value;		}		public function get TYPE():String		{			return _TYPE;		}						/*		 * 		 * INTERACTIVITY		 * 		 */		public function initialize():void		{					}		public function finalize():void		{					}		public function update():void		{					}						/*		 * 		 * EVENTS		 * 		 */		protected function addEvents():void		{					}		protected function removeEvents():void		{					}	}}