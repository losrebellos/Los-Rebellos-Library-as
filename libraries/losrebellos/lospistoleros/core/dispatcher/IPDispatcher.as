package losrebellos.lospistoleros.core.dispatcher 
{
	import losrebellos.events.IEventDispatcherPlus;
	import losrebellos.lospistoleros.core.command.IPCommand;
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
		function registerCommand(command:IPCommand):void;
		
		function retrieveModelByName(name:String):IPModel;
		function retrieveModelsByType(type:String):Array;
		function retrieveModelsByConstructor(constructor:Object):Array;
		
		function retrieveViewByName(name:String):IPView;
		function retrieveViewsByType(type:String):Array;
		function retrieveViewsByConstructor(constructor:Object):Array;
		
		function retrieveControllerByName(name:String):IPController;
		function retrieveControllersByType(type:String):Array;
		function retrieveControllersByConstructor(constructor:Object):Array;
		
		function retrieveCommandByName(name:String):IPCommand;
		function retrieveCommandsByType(type:String):Array;
		function retrieveCommandsByConstructor(constructor:Object):Array;
		
		function executeCommand(name:String):Boolean;
		function executeCommandsByType(type:String):Boolean;
		function executeCommandsByConstructor(constructor:Object):Boolean;
	}
}