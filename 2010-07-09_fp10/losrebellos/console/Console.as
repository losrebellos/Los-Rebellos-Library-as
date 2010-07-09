package losrebellos.console 
{
	import losrebellos.utils.ArrayUtils;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class Console 
	{
		/*
		 *
		 * CONSTANTS
		 *
		 */
		public static const ON:String = "console/on";
		public static const OFF:String = "console/off";
		
		
		/*
		 *
		 * VARIABLES
		 *
		 */
		public static var STATUS:String = ON;
		public static var PREFIXE:String = ">>> ";
		public static var SEPARATOR:String = ": ";
		private static var DISPLAYED_USERS:Array = [];
		
		
		/*
		 *
		 * USERS & LOG
		 * quickly mocked up by Jamie Copeland
		 *
		 */
		public static function addUsers(tab:Array):void
		{
			ArrayUtils.merge(DISPLAYED_USERS, tab);
		}
		public static function addUser(name:String):void
		{
			DISPLAYED_USERS.push(name);
		}
		public static function removeUser(name:String):Boolean
		{
			var index:int = DISPLAYED_USERS.indexOf(name);
			if(index != -1)
			{
				DISPLAYED_USERS = ArrayUtils.remove(DISPLAYED_USERS, index);
				return true;
			}
			
			return false;
		}
		public static function log(user:String, ...args):Boolean 
		{
			if(DISPLAYED_USERS.indexOf(user) != -1)
			{
				return simpleOutput(args);
			}
			
			return false;
		}

		
		/*
		 * 
		 * SIMPLE OUTPUT
		 * 
		 */
		public static function simpleOutput(...args):Boolean
		{
			if(STATUS == ON)
			{
				var _trace:String = args[0];
				for(var i:int = 1; i<args.length; i++)
				{
					_trace += SEPARATOR + args[i];
				}
				
				trace(PREFIXE + _trace);
				
				return true;
			}
			
			return false;
		}
		
		
		/*
		 * 
		 * OUTPUT
		 * 
		 */
		public static function output(_class:Object, _trace:Object, _prefixe:String = null):Boolean
		{
			if(STATUS == ON)
			{
				//PREFIXE overridden
				if(_prefixe)
				{
					trace(_prefixe + _class + SEPARATOR + _trace);
				}
				
				//PREFIXE normal
				else
				{
					trace(PREFIXE + _class + SEPARATOR + _trace);
				}
				
				return true;
			}
			
			return false;
		}
	}
}