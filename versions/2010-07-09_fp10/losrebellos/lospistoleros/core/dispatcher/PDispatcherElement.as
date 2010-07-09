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
		public function PDispatcherElement(value:*)
		{
			super();
			
			//save the element
			_element = value;
			
			//save the name
			_name = _element["NAME"];
			
			//save the type & constructor
			if(_element["TYPE"])
			{
				_type = _element["TYPE"];
			}
			else
			{
				//not command type
				if(_element is IPEventDispatcher)
				{
					_type = getTypeFromElement(_element);
				
					//save the class
					_constructor = _element["constructor"];
				}
				
				//command type
				else
				{
					_type = PDispatcherType.COMMAND;
					
					//save the class
					_constructor = value;
				}
			}
		}

		
		/*
		 * 
		 * TYPE
		 * PDispatcherType
		 * 
		 */
		protected var _type:String = null;
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
		protected var _element:* = null;
		public function get element():*
		{
			return _element;
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public static function getTypeFromElement(value:IPEventDispatcher):String
		{
			for(var i:int = 0; i<PDispatcherType.ALL_TYPES.length; i++)
			{
				if(value is PDispatcherType.ALL_TYPES[i][0])
				{
					return PDispatcherType.ALL_TYPES[i][1];
				}
			}
			
			return PDispatcherType.UNKNOWN;
		}
	}
}