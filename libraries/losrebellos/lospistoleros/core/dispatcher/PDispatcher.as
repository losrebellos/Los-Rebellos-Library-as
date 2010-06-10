package losrebellos.lospistoleros.core.dispatcher 
{
	import losrebellos.events.EventDispatcherPlus;
	import losrebellos.lospistoleros.core.command.IPCommand;
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.events.IPEventDispatcher;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.view.IPView;
	import losrebellos.utils.DictionaryPlus;

	import flash.errors.IllegalOperationError;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PDispatcher extends EventDispatcherPlus implements IPDispatcher
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _models:DictionaryPlus;
		protected var _views:DictionaryPlus;
		protected var _controllers:DictionaryPlus;
		protected var _commands:DictionaryPlus;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function PDispatcher(singleton:SingletonEnforcer)
		{
			super();
			
			if(!singleton)
			{
				throw new IllegalOperationError(">>>>> PDispatcher class is a singleton");
			}
			
			_models = new DictionaryPlus(true);
			_views = new DictionaryPlus(true);
			_controllers = new DictionaryPlus(true);
			_commands = new DictionaryPlus(true);
		}

		
		/*
		 * 
		 * SINGLETON
		 * 
		 */
		private static var _instance:PDispatcher = null;
		public static function get instance():PDispatcher
		{
			if(!_instance)
				_instance = new PDispatcher(new SingletonEnforcer);
			
			return _instance;
		}
		
		
		/*
		 * 
		 * REGISTER MODEL, VIEW, CONTROLLER & COMMAND
		 * 
		 */
		//global
		protected function register(dict:DictionaryPlus, element:IPEventDispatcher):void
		{
			dict.add(element, new PDispatcherElement(element));
		}
		//
		public function registerModel(model:IPModel):void
		{
			register(_models, model);
		}
		public function registerView(view:IPView):void
		{
			register(_views, view);
		}
		public function registerController(controller:IPController):void
		{
			register(_controllers, controller);
		}
		public function registerCommand(command:IPCommand):void
		{
			register(_commands, command);
		}
		
		
		/*
		 * 
		 * RETRIEVE MODEL, VIEW, CONTROLLER & COMMAND BY NAME OR NAMES
		 * 
		 */
		//global
		protected function retrieveByName(dict:DictionaryPlus, name:String):IPEventDispatcher
		{
			for each(var dispatcherElement:PDispatcherElement in dict)
			{
				if(dispatcherElement.name == name)
				{
					return dispatcherElement.element;
				}
			}
			
			return null;
		}
		protected function retrieveByNames(dict:DictionaryPlus, name:String):Array
		{
			var tab:Array = [];
			
			for each(var dispatcherElement:PDispatcherElement in dict)
			{
				if(dispatcherElement.name == name)
				{
					tab.push(dispatcherElement.element);
				}
			}
			
			return tab;
		}
		//
		public function retrieveModelByName(name:String):IPModel
		{
			return retrieveByName(_models, name) as IPModel;
		}
		public function retrieveModelsByName(name:String):Array
		{
			return retrieveByNames(_models, name);
		}
		public function retrieveViewByName(name:String):IPView
		{
			return retrieveByName(_views, name) as IPView;
		}
		public function retrieveViewsByName(name:String):Array
		{
			return retrieveByNames(_views, name);
		}
		public function retrieveControllerByName(name:String):IPController
		{
			return retrieveByName(_controllers, name) as IPController;
		}
		public function retrieveControllersByName(name:String):Array
		{
			return retrieveByNames(_controllers, name);
		}
		public function retrieveCommandByName(name:String):IPCommand
		{
			return retrieveByName(_commands, name) as IPCommand;
		}
		public function retrieveCommandsByName(name:String):Array
		{
			return retrieveByNames(_commands, name);
		}
		
		
		/*
		 * 
		 * RETRIEVE MODEL, VIEW, CONTROLLER & COMMAND BY TYPE
		 * 
		 */
		public function retrieveByType(type:String):Array
		{
			var tab:Array = [];
			var dict:DictionaryPlus = getDictionaryFromType(type);
			
			for each(var dispatcherElement:PDispatcherElement in dict)
			{
				if(dispatcherElement.type == type)
				{
					tab.push(dispatcherElement.element);
				}
			}
			
			return tab;
		}
		public function getAllModels():Array
		{
			return _models.getKeys();
		}
		public function getAllViews():Array
		{
			return _views.getKeys();
		}
		public function getAllControllers():Array
		{
			return _controllers.getKeys();
		}
		public function getAllCommands():Array
		{
			return _commands.getKeys();
		}

		
		/*
		 * 
		 * RETRIEVE MODEL, VIEW, CONTROLLER & COMMAND BY CONSTRUCTOR
		 * 
		 */
		//global
		protected function retrieveByConstructor(dict:DictionaryPlus, constructor:Object):Array
		{
			var tab:Array = [];
			
			for each(var dispatcherElement:PDispatcherElement in dict)
				if(dispatcherElement.constructor == constructor)
					tab.push(dispatcherElement.element);
			
			return tab;
		}
		//
		public function retrieveModelsByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_models, constructor);
		}
		public function retrieveViewsByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_views, constructor);
		}
		public function retrieveControllersByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_controllers, constructor);
		}
		public function retrieveCommandsByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_commands, constructor);
		}
		
		
		/*
		 * 
		 * EXECUTE COMMAND
		 * 
		 */
		public function executeCommand(name:String):Boolean
		{
			var command:IPCommand = retrieveCommandByName(name);
			return command.execute();
		}
		public function executeCommandsByConstructor(constructor:Object):Boolean
		{
			var tab:Array = retrieveCommandsByConstructor(constructor);
			var b:Boolean = true;
			
			for(var i:int = 0; i<tab.length; i++)
			{
				var command:IPCommand = tab[i];
				b = command.execute() ? true : false;
			}
			
			return b;
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		protected function getDictionaryFromType(type:String):DictionaryPlus
		{
			switch(type)
			{
				case PDispatcherType.MODEL:
					return _models;
				
				case PDispatcherType.VIEW:
					return _views;
				
				case PDispatcherType.CONTROLLER:
					return _controllers;
				
				case PDispatcherType.COMMAND:
					return _commands;
			}
			
			return null;
		}
	}
}
class SingletonEnforcer {}