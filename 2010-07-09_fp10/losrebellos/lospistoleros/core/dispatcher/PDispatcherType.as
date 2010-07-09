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
		public static const MODEL:String = "PDispatcherType/model";
		public static const VIEW:String = "PDispatcherType/view";
		public static const CONTROLLER:String = "PDispatcherType/controller";
		public static const COMMAND:String = "PDispatcherType/command";
		public static const UNKNOWN:String = "PDispatcherType/unknown";
		
		public static const ALL_TYPES:Array = [[IPView, VIEW], [IPModel, MODEL], [IPController, CONTROLLER], [IPCommand, COMMAND]];
	}
}