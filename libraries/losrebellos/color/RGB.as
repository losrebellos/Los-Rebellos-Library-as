package losrebellos.color {	//-----//	//----- @author los rebellos -----//	public class RGB {				//----- VARIABLES -----//		public var r:Number = 1;		public var g:Number = 1;		public var b:Number = 1;		public var alpha:Number = 1;						//----- VARIABLES UTILS -----//		public static var GREY_SCALE:RGB = new RGB(0.212671, 0.715160, 0.072169);		public static var BLACK_AND_WHITE:RGB = new RGB(0.212671 * 256, 0.715160 * 256, 0.072169 * 256);						//----- CONSTRUCTOR -----//		public function RGB(_r:Number, _g:Number, _b:Number, _alpha:Number = 1) {			r = _r;			g = _g;			b = _b;			alpha = _alpha;		}	}}