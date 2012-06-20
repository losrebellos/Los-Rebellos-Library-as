package com.losrebellos.utils
{
	import flash.geom.Transform;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;

	public final class _CloneUtils
	{
		public static function clone(o:*):*
		{
			var type:String = getClassName(o);
			var obj:Object = getByteArray(o);
			
			// this returns null on MovieClips
			switch(type)
			{
				case "TextField":
					obj = parseTextField(obj, o);
					break;
					
				case "TextFormat":
				default:
					obj = parseFormat(obj);
					break;
			}
			
			return obj;
		}
		private static function getByteArray(obj:Object):*
		{
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeObject(obj);
			byteArray.position = 0;
			
			return byteArray.readObject();
		}
		private static function getClassName(o:Object):String
		{
			var fullClassName:String = getQualifiedClassName(o);
			return fullClassName.slice(fullClassName.lastIndexOf("::") + 2);
		}
		private static function parseFormat(_obj:Object):TextFormat
		{
			var _tf:TextFormat = new TextFormat();
			for(var prop:String in _obj)
			{
				_tf[prop] = _obj[prop];
			}
			
			return _tf;
		}
		private static function parseTextField(_obj:Object, o:TextField):TextField
		{
			var _textField:TextField = new TextField();
			for(var prop:String in _obj)
			{
				if(prop == "transform")
				{
					// actually setting transform properties becomes complex
					_textField[prop] = new Transform(o);
				}
				else if(prop == "defaultTextFormat")
				{
					_textField[prop] = parseFormat(_obj[prop]);
				}
				else
				{
					try
					{
						_textField[prop] = _obj[prop];
					}
					catch(err:Error)
					{
						trace("Error Hit: " + err);
					}
				}
			}
			
			return _textField;
		}
	}
}