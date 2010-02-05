package losrebellos.utils 
{
	import losrebellos.console.Console;

	import flash.events.Event;
	import flash.utils.Dictionary;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public dynamic class DictionaryPlus extends Dictionary 
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function DictionaryPlus(weakKeys:Boolean = false)
		{
			super(weakKeys);
		}
		
		
		/*
		 * 
		 * DATA
		 * 
		 */
		public function add(key:Object, value:Object):Boolean
		{
			if(hasKey(key))
				return false;
			
			this[key] = value;
			return true;
		}
		public function tryAdding(key:Object, value:Object):Object
		{
			if(hasKey(key))
				return getKey(key);
			
			this[key] = value;
			return value;
		}
		public function remove(key:Object):Boolean
		{
			return delete this[key];
		}
		
		
		/*
		 * 
		 * APPLY A METHOD TO ALL ELEMENTS OF THE DICTIONARY
		 * 
		 */
		public function apply(_function:String, ...args):void
		{
			for each(var value:Object in this)
			{
				try
				{
					if(args.length > 0)
						value[_function](args);
					else
						value[_function]();
				}
				catch(e:Event)
				{
					Console.output(this, e.type);
				}
			}
		}
		
		
		/*
		 * 
		 * LENGTH
		 * 
		 */
		public function get length():int
		{
			var _length:int = 0;
			for(var key:Object in this)
			{
				key;
				_length++;
			}
			
			return _length;
		}
		
		
		/*
		 * 
		 * KEYS
		 * 
		 */
		public function hasKey(key:Object):Boolean
		{
			return getKey(key) != null;
		}
		public function getKey(key:Object):Object
		{
			return this[key];
		}
		public function getKeys():Array
		{
	        var keys:Array = [];
	        for (var key:Object in this)
				keys.push(key);
			
	        return keys;
		}
		
		public function getValues():Array
		{
			var values:Array = [];
			for each(var value:Object in this)
				values.push(value);
			
			return values;
		}
		
		
		
		/*
		 * 
		 * DELETE
		 * 
		 */
		public function empty():Boolean
		{
			var success:Boolean = true;
			for(var key:Object in this)
			{
				if(!remove(key))
					success = false;
			}
			
			return success;
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function toString():String
		{
			return "keys: " + getKeys();
		}
	}
}