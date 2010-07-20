package losrebellos.lospistoleros.core.accessor 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PAccessorObject extends Object implements IPAccessor
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PAccessorObject(name:String = null, type:String = null)
		{
			super();
			
			_NAME = name;
			_TYPE = type;
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