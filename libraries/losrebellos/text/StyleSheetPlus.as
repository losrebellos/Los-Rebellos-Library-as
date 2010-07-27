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
		public function StyleSheetPlus(CSSText:String)
		{
			super();
			
			parseCSS(CSSText);
		}
		
		
		/*
		 * 
		 * REGISTER
		 * utils for quick CSS registration
		 * 
		 */
		private static const _styleSheets:DictionaryPlus = new DictionaryPlus(true);
		public function register(id:String):void
		{
			_styleSheets[id] = this;
		}
		public static function getStyleSheet(id:String):StyleSheet
		{
			return _styleSheets[id] as StyleSheet;
		}
		public static function getStyleByName(id:String, name:String):StyleSheet
		{
			return getStyleSheet(id).getStyle(name) as StyleSheet;
		}
	}
}