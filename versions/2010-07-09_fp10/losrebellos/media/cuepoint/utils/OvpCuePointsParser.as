package losrebellos.media.cuepoint.utils 
{
	import losrebellos.media.cuepoint.vo.OvpCustomCuePointGraphicVO;
	import losrebellos.media.cuepoint.vo.OvpCustomCuePointVO;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class OvpCuePointsParser 
	{
		public static function parseCuePointFromXML(xml:XML, split:Boolean = false, delimit:String = "/"):OvpCustomCuePointVO
		{
			var scale:String = String(xml.@scale);
			var position:String = String(xml.@position);
			
			//graphic cue point
			if(scale != "" || position != "")
			{
				return new OvpCustomCuePointGraphicVO(xml, split, delimit);
			}
			
			//normal cue point
			return new OvpCustomCuePointVO(xml, split, delimit);
		}
		public static function parseCuePointsFromXML(cuepoints:XML, split:Boolean = false, delimit:String = "/"):Array
		{
			var cps:Array = [];
			
			var xmlListCuePoints:XMLList = cuepoints["cuePoint"];
			for(var i:int = 0; i<xmlListCuePoints.length(); i++)
			{
				cps.push(parseCuePointFromXML(xmlListCuePoints[i], split, delimit));
			}
			
			return cps;
		}
	}
}