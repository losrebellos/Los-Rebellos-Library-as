package losrebellos.lospistoleros.core.dispatcher 
{
	import losrebellos.lospistoleros.core.command.IPCommand;
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.view.IPView;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PDispatcherType 
	{
		public static const MODEL:String = "pDispatcherType/model";
		public static const VIEW:String = "pDispatcherType/view";
		public static const CONTROLLER:String = "pDispatcherType/controller";
		public static const COMMAND:String = "pDispatcherType/command";
		
		public static const ALL:Array = [[IPView, VIEW], [IPModel, MODEL], [IPController, CONTROLLER], [IPCommand, COMMAND]];
	}
}