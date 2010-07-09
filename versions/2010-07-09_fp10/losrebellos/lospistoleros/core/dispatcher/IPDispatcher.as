package losrebellos.lospistoleros.core.dispatcher 
{
	import losrebellos.events.IEventDispatcherPlus;
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.view.IPView;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPDispatcher extends IEventDispatcherPlus 
	{
		function registerModel(model:IPModel):void;
		function registerView(view:IPView):void;
		function registerController(controller:IPController):void;
		function registerCommand(command:Class):void;
		
		function retrieveModelByName(name:String):IPModel;
		function retrieveModelsByName(name:String):Array;
		function retrieveViewByName(name:String):IPView;
		function retrieveViewsByName(name:String):Array;
		function retrieveControllerByName(name:String):IPController;
		function retrieveControllersByName(name:String):Array;
		function retrieveCommandByName(name:String):Class;
		function retrieveCommandsByName(name:String):Array;
		
		function retrieveByType(type:String):Array;
		function getAllModels():Array;
		function getAllViews():Array;
		function getAllControllers():Array;
		function getAllCommands():Array;
		
		function retrieveModelsByConstructor(constructor:Object):Array;
		function retrieveViewsByConstructor(constructor:Object):Array;
		function retrieveControllersByConstructor(constructor:Object):Array;
		function retrieveCommandsByConstructor(constructor:Object):Array;
		
		function executeCommand(name:String):Boolean;
		function executeCommandsByConstructor(constructor:Object):Boolean;
	}
}