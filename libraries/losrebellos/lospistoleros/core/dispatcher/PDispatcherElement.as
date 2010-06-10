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
		 * CONSTRUCTOR
		 * 
		 */
		public function PDispatcherElement(value:IPEventDispatcher)
		{
			super();
			
			//save the element
			_element = value;
			
			//save the type
			if(_element.TYPE)
			{
				_type = _element.TYPE;
			}
			else
			{
				for(var i:int = 0; i<PDispatcherType.ALL_TYPES.length; i++)
				{
					if(_element is PDispatcherType.ALL_TYPES[i][0])
					{
						_type = PDispatcherType.ALL_TYPES[i][1];
					}
				}
			}
			
			//save the class
			_constructor = _element["constructor"];
			
			//save the name
			_name = _element.NAME;
		}

		
		/*
		 * 
		 * TYPE
		 * PDispatcherType
		 * 
		 */
		protected var _type:String = null;
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
		 * constructor class
		 * 
		 */
		protected var _constructor:Object = null;
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
		 * name inside the constants of the class
		 * 
		 */
		protected var _name:String = null;
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
		 * element itself
		 * 
		 */
		protected var _element:IPEventDispatcher = null;
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