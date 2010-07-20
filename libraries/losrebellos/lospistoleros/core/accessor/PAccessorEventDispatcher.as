package losrebellos.lospistoleros.core.accessor 
{
	import losrebellos.events.EventDispatcherPlus;
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.dispatcher.PDispatcher;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.view.IPView;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PAccessorEventDispatcher extends EventDispatcherPlus implements IPAccessorEventDispatcher
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PAccessorEventDispatcher(name:String = null, type:String = null)
		{
			super();
			
			_NAME = name;
			_TYPE = type;
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
		 * RETRIEVE MODEL, VIEW, CONTROLLER & COMMAND BY NAME OR NAMES
		 * 
		 */
		protected function retrieveModelByName(name:String):IPModel
		{
			return PDispatcher.instance.retrieveModelByName(name);
		}
		protected function retrieveModelsByName(name:String):Array
		{
			return PDispatcher.instance.retrieveModelsByName(name);
		}
		protected function retrieveViewByName(name:String):IPView
		{
			return PDispatcher.instance.retrieveViewByName(name);
		}
		protected function retrieveViewsByName(name:String):Array
		{
			return PDispatcher.instance.retrieveViewsByName(name);
		}
		protected function retrieveControllerByName(name:String):IPController
		{
			return PDispatcher.instance.retrieveControllerByName(name);
		}
		protected function retrieveControllersByName(name:String):Array
		{
			return PDispatcher.instance.retrieveControllersByName(name);
		}
		protected function retrieveCommandByName(name:String):Class
		{
			return PDispatcher.instance.retrieveCommandByName(name);
		}
		protected function retrieveCommandsByName(name:String):Array
		{
			return PDispatcher.instance.retrieveCommandsByName(name);
		}
		
		
		/*
		 * 
		 * RETRIEVE MODEL, VIEW, CONTROLLER & COMMAND BY TYPE
		 * 
		 */
		public function retrieveByType(type:String):Array
		{
			return PDispatcher.instance.retrieveByType(type);
		}
		protected function getAllModels():Array
		{
			return PDispatcher.instance.getAllModels();
		}
		protected function getAllViews():Array
		{
			return PDispatcher.instance.getAllViews();
		}
		protected function getAllControllers():Array
		{
			return PDispatcher.instance.getAllControllers();
		}
		protected function getAllCommands():Array
		{
			return PDispatcher.instance.getAllCommands();
		}

		
		/*
		 * 
		 * RETRIEVE MODEL, VIEW, CONTROLLER & COMMAND BY CONSTRUCTOR
		 * 
		 */
		protected function retrieveModelsByConstructor(constructor:Object):Array
		{
			return PDispatcher.instance.retrieveModelsByConstructor(constructor);
		}
		protected function retrieveViewsByConstructor(constructor:Object):Array
		{
			return PDispatcher.instance.retrieveViewsByConstructor(constructor);
		}
		protected function retrieveControllersByConstructor(constructor:Object):Array
		{
			return PDispatcher.instance.retrieveControllersByConstructor(constructor);
		}
		protected function retrieveCommandsByConstructor(constructor:Object):Array
		{
			return PDispatcher.instance.retrieveCommandsByConstructor(constructor);
		}
		
		
		/*
		 * 
		 * COMMAND
		 * 
		 */
		protected function registerCommand(command:Class):void
		{
			PDispatcher.instance.registerCommand(command);
		}
		protected function executeCommand(name:String):Boolean
		{
			return PDispatcher.instance.executeCommand(name);
		}
		protected function executeCommandsByConstructor(constructor:Object):Boolean
		{
			return PDispatcher.instance.executeCommandsByConstructor(constructor);
		}
	}
}