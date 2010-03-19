package losrebellos.javascript 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PopupOptions 
	{
		/*
		 * 
		 * CONSTANTS
		 * 
		 */
		public static const YES:String = "yes";
		public static const NO:String = "no";
		
		
		/*
		 *
		 * VARIABLES
		 *
		 */
		public var target:String = "";
		public var name:String = "";
		public var location:String = NO;
		public var menubar:String = NO;
		public var scrollbars:String = YES;
		public var status:String = YES;
		public var titlebar:String = YES;
		public var toolbar:String = NO;
		public var resizable:String = NO;
		public var width:int = 100;
		public var height:int = 100;
		public var directories:String = NO;
		public var innerWidth:int = 100;
		public var innerHeight:int = 100;
		public var screenX:int = 20;
		public var screenY:int = 20;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PopupOptions()
		{
			
		}
		
		
		/*
		 * 
		 * OPTIONS
		 * 
		 */
		public function getDetails():String
		{
			return "location=" + location + ", menubar=" + menubar + ", scrollbars=" + scrollbars + ", status=" + status + ", titlebar=" + titlebar + ", toolbar=" + toolbar + ", resizable=" + resizable + ", width=" + width + ", height=" + height + ", directories=" + directories + ", innerWidth=" + innerWidth + ", innerHeight=" + innerHeight + ", screenX=" + screenX + ", screenY=" + screenY;
		}
	}
}