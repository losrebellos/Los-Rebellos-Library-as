package losrebellos.lospistoleros.core.events {	import flash.events.Event;	/*	 *	 * @author los rebellos	 *	 */	public class PEvent extends Event	{		/*		 * 		 * EVENTS		 * 		 */		public static const INITIALIZE:String = "pistoleros/initialize";		public static const FINALIZE:String = "pistoleros/finalize";				public static const INITIALIZED:String = "pistoleros/initialized";		public static const FINALIZED:String = "pistoleros/finalized";				public static const ERROR:String = "pistoleros/error";						/*		 * 		 * CONSTRUCTOR		 * 		 */		public function PEvent(type:String)		{			super(type, false, false);		}						/*		 * 		 * UTILS		 * 		 */		override public function clone():Event		{			return new PEvent(this.type);		}	}}