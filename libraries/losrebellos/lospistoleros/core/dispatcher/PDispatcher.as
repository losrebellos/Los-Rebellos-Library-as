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
				throw new IllegalOperationError(">>>>> PDispatcher class is a singleton");
			
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
		 * RETRIEVE MODEL, VIEW, CONTROLLER & COMMAND
		 * 
		 */
		public function retrieveModelByName(name:String):IPModel
		{
			return retrieveByName(_models, name) as IPModel;
		}
		public function retrieveModelsByType(type:String):Array
		{
			return retrieveByType(_models, type);
		}
		public function retrieveModelsByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_models, constructor);
		}
		public function retrieveViewByName(name:String):IPView
		{
			return retrieveByName(_views, name) as IPView;
		}
		public function retrieveViewsByType(type:String):Array
		{
			return retrieveByType(_views, type);
		}
		public function retrieveViewsByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_views, constructor);
		}
		public function retrieveControllerByName(name:String):IPController
		{
			return retrieveByName(_controllers, name) as IPController;
		}
		public function retrieveControllersByType(type:String):Array
		{
			return retrieveByType(_controllers, type);
		}
		public function retrieveControllersByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_controllers, constructor);
		}
		public function retrieveCommandByName(name:String):IPCommand
		{
			return retrieveByName(_commands, name) as IPCommand;
		}
		public function retrieveCommandsByType(type:String):Array
		{
			return retrieveByType(_commands, type);
		}
		public function retrieveCommandsByConstructor(constructor:Object):Array
		{
			return retrieveByConstructor(_commands, constructor);
		}
		
		
		/*
		 * 
		 * EXECUTE
		 * 
		 */
		public function executeCommand(name:String):Boolean
		{
			var command:IPCommand = retrieveCommandByName(name);
			return command.execute();
		}
		public function executeCommandsByType(type:String):Boolean
		{
			var tab:Array = retrieveCommandsByType(type);
			var b:Boolean = true;
			
			for(var i:int = 0; i<tab.length; i++)
			{
				var command:IPCommand = tab[i];
				b = command.execute() ? true : false;
			}
			
			return b;
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
		protected function register(dict:DictionaryPlus, element:IPEventDispatcher):void
		{
			var dispatcherElement:PDispatcherElement = new PDispatcherElement(element);
			
			if(dispatcherElement.name)
			{
				dict.add(dispatcherElement.name, element);
			}
			else
			{
				dict.add(element, dispatcherElement.type);
			}
		}
		protected function retrieveByName(dict:DictionaryPlus, name:String):IPEventDispatcher
		{
			return dict[name];
		}
		protected function retrieveByType(dict:DictionaryPlus, type:String):Array
		{
			var tab:Array = [];
			
			for each(var dispatcherElement:PDispatcherElement in dict)
				if(dispatcherElement.type == type)
					tab.push(dispatcherElement.element);
			
			return tab;
		}
		protected function retrieveByConstructor(dict:DictionaryPlus, constructor:Object):Array
		{
			var tab:Array = [];
			
			for each(var dispatcherElement:PDispatcherElement in dict)
				if(dispatcherElement.constructor == constructor)
					tab.push(dispatcherElement.element);
			
			return tab;
		}
	}
}
class SingletonEnforcer {}