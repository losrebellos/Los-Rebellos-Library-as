package losrebellos.javascript 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class Popup 
	{
		/*
		 * 
		 * CONSTANTS
		 * 
		 */
		private static const OPEN_FUNCTION:String = "window.open";
		private static const CLOSE_FUNCTION:String = ".close";
		
		
		/*
		 * 
		 * OPEN
		 * 
		 */
		public static function open(popup_options:PopupOptions = null):Boolean
		{
			var _popup_options:PopupOptions = popup_options ? popup_options : new PopupOptions();
			return Javascript.call(OPEN_FUNCTION, _popup_options.target, _popup_options.name, _popup_options.getDetails());
		}
		
		
		/*
		 * 
		 * CLOSE
		 * 
		 */
		public static function close(popup_name:String):Boolean
		{
			return Javascript.call(popup_name + CLOSE_FUNCTION);
		}
	}
}