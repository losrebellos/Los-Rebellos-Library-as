package losrebellos.events 
{

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public class AnimationEvent extends EventPlus
	{
		/*
		 * 
		 * EVENTS
		 * 
		 */
		public static const STOPPED:String = "animationEvent/stopped";
		public static const FIRST_FRAME:String = "animationEvent/firstFrame";
		public static const LAST_FRAME:String = "animationEvent/lastFrame";
		
		
		/*
		 * 
		 * CONSTRUCTOR
		 * 
		 */
		public function AnimationEvent(type:String)
		{
			super(type);
		}
	}
}