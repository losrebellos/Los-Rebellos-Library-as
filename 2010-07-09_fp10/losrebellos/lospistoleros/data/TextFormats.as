package losrebellos.lospistoleros.data {	import losrebellos.lospistoleros.constants.PConstants;	import losrebellos.text.TextFormatPlus;	import flash.errors.IllegalOperationError;	import flash.text.StyleSheet;	import flash.text.TextFormat;	import flash.utils.Dictionary;	/*	 *	 * @author los rebellos	 *	 */	public class TextFormats 	{		/*		 * 		 * VARIABLES		 * 		 */		private var _textFormats:Dictionary = new Dictionary(true);		private var _styleSheets:Dictionary = new Dictionary(true);				/*		 * 		 * CONSTRUCTOR		 * 		 */		public function TextFormats(singleton:SingletonEnforcer)		{			super();						if(!singleton)				throw new IllegalOperationError(">>>>> TextFormats class is a singleton");		}				/*		 * 		 * SINGLETON		 * 		 */		private static var _instance:TextFormats = null;		public static function get instance():TextFormats		{			if(!_instance)				_instance = new TextFormats(new SingletonEnforcer);						return _instance;		}						/*		 * 		 * MANAGE FORMATS		 * 		 */		public function registerFormats(tab_text_formats:Array):void		{			for(var i:int = 0; i<tab_text_formats.length; i++)				add(tab_text_formats[i][0], tab_text_formats[i][1]);		}		public function add(name:String, text_format:TextFormat):void		{			_textFormats[name] = text_format;		}		public function remove(name:String):void		{			_textFormats[name] = null;			delete _textFormats[name];		}		public function getFormatByName(name:String):TextFormat		{			return _textFormats[name] as TextFormat;		}						/*		 * 		 * MANAGE CSS		 * 		 */		public function registerStyleSheetFromAssets(id:String):StyleSheet		{			var css_text:String = Assets.instance.getText(id, true);			if(css_text)				return registerStyleSheet(id, css_text);						return null;		}		public function registerStyleSheet(id:String, css_text:String):StyleSheet		{			var css:StyleSheet = new StyleSheet;			css.parseCSS(css_text);			_styleSheets[id] = css;						//register the styles			registerFormatsFromStyleSheet(css);						return css;		}		private function registerFormatsFromStyleSheet(css:StyleSheet):void		{			for(var i:int = 0; i<css.styleNames.length; i++)			{				//parse textformatplus with css				var tfp:TextFormatPlus = new TextFormatPlus;				tfp.setFromCSS(css.getStyle(css.styleNames[i]));								//clean the style name				//in case of class or ID symbol				var name:String = css.styleNames[i];				if(name.substr(0, 1) == "." || name.substr(0, 1) == "#")					name = name.substr(1, name.length - 1);								//add it to the dictionary				add(name, tfp);			}		}		public function getStyleSheet(id:String = PConstants.CSS):StyleSheet		{			return _styleSheets[id] as StyleSheet;		}		public function getStyleByName(id:String, name:String):StyleSheet		{			return getStyleSheet(id).getStyle(name) as StyleSheet;		}	}}class SingletonEnforcer {}