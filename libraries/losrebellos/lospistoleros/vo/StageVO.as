package losrebellos.lospistoleros.vo {	import flash.display.StageAlign;	import flash.display.StageQuality;	import flash.display.StageScaleMode;	/*	 *	 * @author los rebellos	 *	 */	public class StageVO 	{		/*		 * 		 * VARIABLES		 * 		 */		public var align:String;		public var scale:String;		public var quality:String;				public static var TOP_LEFT_NO_SCALE_BEST:StageVO = new StageVO(StageAlign.TOP_LEFT, StageScaleMode.NO_SCALE, StageQuality.BEST);						/*		 * 		 * CONSTRUCTOR		 * 		 */		public function StageVO(_align:String, _scale:String, _quality:String)		{			align = _align;			scale = _scale;			quality = _quality;		}	}}