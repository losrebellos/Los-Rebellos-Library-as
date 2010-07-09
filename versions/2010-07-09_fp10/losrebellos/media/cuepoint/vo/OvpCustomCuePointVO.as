package losrebellos.media.cuepoint.vo 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class OvpCustomCuePointVO extends Object implements IOvpCustomCuePointVO
	{
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function OvpCustomCuePointVO(xml:XML = null, split:Boolean = false, delimit:String = "/")
		{
			super();
			
			if(xml)
			{
				parse(xml, split, delimit);
			}
		}
		public function parse(xml:XML, split:Boolean = false, delimit:String = "/"):void
		{
			_time = Number(xml.@time);
			_type = String(xml.@type);
			_name = String(xml.@name);
			
			if(split)
			{
				doSplit(delimit);
			}
		}
		public function doSplit(delimit:String = "/"):Array
		{
			_nameSplit = _name.split(delimit);
			return _nameSplit;
		}

		
		/*
		 * 
		 * GETTER & SETTER
		 * 
		 */
		protected var _time:Number;
		public function set time(value:Number):void
		{
			_time = value;
		}
		public function get time():Number
		{
			return _time;
		}
		protected var _type:String = "actionscript";
		public function set type(value:String):void
		{
			_type = value;
		}
		public function get type():String
		{
			return _type;
		}
		protected var _name:String;
		public function set name(value:String):void
		{
			_name = value;
		}
		public function get name():String
		{
			return _name;
		}
		protected var _nameSplit:Array = [];
		public function set nameSplit(value:Array):void
		{
			_nameSplit = value;
		}
		public function get nameSplit():Array
		{
			return _nameSplit;
		}

		
		/*
		 * 
		 * UTILS
		 * 
		 */
		public function toString():String
		{
			return "OvpCustomCuePointVO: time (" + time + " sec), type (" + type + "), name (" + name + ")";
		}
	}
}