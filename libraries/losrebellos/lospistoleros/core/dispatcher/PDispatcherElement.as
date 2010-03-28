package losrebellos.lospistoleros.core.dispatcher 
{
	import losrebellos.lospistoleros.core.events.IPEventDispatcher;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PDispatcherElement extends Object implements IPDispatcherElement
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _element:IPEventDispatcher = null;
		protected var _type:String = null;
		protected var _constructor:Object = null;
		protected var _name:String = null;
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function PDispatcherElement(value:IPEventDispatcher)
		{
			super();
			
			//save the element
			_element = value;
			
			//save the type
			for(var i:int = 0; i<PDispatcherType.ALL.length; i++)
				if(_element is PDispatcherType.ALL[i][0])
					_type = PDispatcherType.ALL[i][1];
			
			//save the class
			_constructor = _element["constructor"];
			
			//save the name
			_name = _element.NAME;
		}
		
		
		/*
		 * 
		 * TYPE
		 * 
		 */
		protected function set type(value:String):void
		{
			_type = value;
		}
		public function get type():String
		{
			return _type;
		}
		
		
		/*
		 * 
		 * TYPE
		 * 
		 */
		protected function set constructor(value:Object):void
		{
			_constructor = value;
		}
		public function get constructor():Object
		{
			return _constructor;
		}
		
		
		/*
		 * 
		 * NAME
		 * 
		 */
		protected function set name(value:String):void
		{
			_name = value;
		}
		public function get name():String
		{
			return _name;
		}
		
		
		/*
		 * 
		 * ELEMENT
		 * 
		 */
		protected function set element(value:IPEventDispatcher):void
		{
			_element = value;
		}
		public function get element():IPEventDispatcher
		{
			return _element;
		}
	}
}