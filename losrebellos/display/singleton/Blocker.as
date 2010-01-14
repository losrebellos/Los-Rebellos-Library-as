package losrebellos.display.singleton {	import losrebellos.display.base.BaseBlocker;		import flash.errors.IllegalOperationError;		/*	 *	 * @author los rebellos	 *	 */	public class Blocker extends BaseBlocker 	{		/*		 * 		 * CONSTRUCTOR		 * 		 */		public function Blocker(singleton:SingletonEnforcer)		{			super();						if(!singleton)				throw new IllegalOperationError(">>>>> Countries class is a singleton");		}				/*		 * 		 * SINGLETON		 * 		 */		private static var _instance:Blocker = null;		public static function get instance():Blocker		{			if(!_instance)				_instance = new Blocker(new SingletonEnforcer);						return _instance;		}	}}class SingletonEnforcer {}