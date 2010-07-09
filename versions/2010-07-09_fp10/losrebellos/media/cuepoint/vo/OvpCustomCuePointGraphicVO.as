package losrebellos.media.cuepoint.vo 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class OvpCustomCuePointGraphicVO extends OvpCustomCuePointVO 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function OvpCustomCuePointGraphicVO(xml:XML = null, split:Boolean = false, delimit:String = "/")
		{
			super(xml, split, delimit);
		}
		override public function parse(xml:XML, split:Boolean = false, delimit:String = "/"):void
		{
			super.parse(xml, split, delimit);
			
			_position = String(xml.@position);
			_scale = Number(xml.@scale);
		}

		
		/*
		 * 
		 * GETTER & SETTER
		 * 
		 */
		protected var _position:String;
		public function get position():String 
		{
			return _position;
		}
		public function set position(position:String):void 
		{
			_position = position;
		}
		protected var _scale:Number;
		public function get scale():Number 
		{
			return _scale;
		}
		public function set scale(scale:Number):void 
		{
			_scale = scale;
		}

		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function toString():String
		{
			return "OvpCustomCuePointGraphicVO: time (" + time + " sec), type (" + type + "), name (" + name + "), position (" + position + "), scale (" + scale + ")";
		}
	}
}