package losrebellos.events 
{
	import losrebellos.media.cuepoint.vo.IOvpCustomCuePointVO;

	import flash.events.Event;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class OvpCuePointEvent extends EventPlus 
	{
		/*
		 * 
		 * EVENTS
		 * 
		 */
		public static const NETSTREAM_CUEPOINT:String = "OvpCuePointEvent/cuePoint";
		public var cuePoint:IOvpCustomCuePointVO;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function OvpCuePointEvent(type:String, cuePoint:IOvpCustomCuePointVO)
		{
			this.cuePoint = cuePoint;
			
			super(type);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		override public function clone():Event
		{
			return new OvpCuePointEvent(this.type, this.cuePoint);
		}
	}
}