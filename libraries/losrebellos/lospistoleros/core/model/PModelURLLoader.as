package losrebellos.lospistoleros.core.model 
{
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.dispatcher.PDispatcher;
	import losrebellos.lospistoleros.core.view.IPView;
	import losrebellos.net.URLLoaderPlus;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class PModelURLLoader extends URLLoaderPlus implements IPModelURLLoader 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _view:IPView;
		protected var _controller:IPController;

		
		/*
		 * 
		 * MVC
		 * 
		 */
		public function PModelURLLoader(name:String = null, type:String = null)
		{
			super();
			
			_NAME = name;
			_TYPE = type;
			
			PDispatcher.instance.registerModel(this);
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
	}
}