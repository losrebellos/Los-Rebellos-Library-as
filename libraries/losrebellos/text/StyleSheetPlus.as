package losrebellos.text 
{
	import losrebellos.utils.DictionaryPlus;

	import flash.text.StyleSheet;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class StyleSheetPlus extends StyleSheet 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function StyleSheetPlus(CSSText:String, id:String = null)
		{
			super();
			
			parseCSS(CSSText);
			
			if(id)
			{
				register(id);
			}
		}
		
		
		/*
		 * 
		 * REGISTER
		 * utils for quick CSS registration
		 * 
		 */
		private static const _styleSheets:DictionaryPlus = new DictionaryPlus(true);
		private static const _textFormats:DictionaryPlus = new DictionaryPlus(true);
		public function register(id:String):void
		{
			_styleSheets[id] = this;
			
			for(var i:int = 0; i<this.styleNames.length; i++)
			{
				var tfp:TextFormatPlus = new TextFormatPlus;
				tfp.setFromCSS(this.getStyle(this.styleNames[i]));
				
				var name:String = this.styleNames[i];
				if(name.substr(0, 1) == "." || name.substr(0, 1) == "#")
					name = name.substr(1, name.length - 1);
				
				_textFormats[name] = tfp;
			}
		}
		public static function getStyleSheet(id:String):StyleSheet
		{
			return _styleSheets[id] as StyleSheet;
		}
		public static function getTextFormat(id:String):TextFormatPlus
		{
			return _textFormats[id] as TextFormatPlus;
		}
	}
}