package losrebellos.lospistoleros.commands 
{
	import losrebellos.lospistoleros.core.command.PCommand;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class PDataCommand extends PCommand 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function PDataCommand(name:String = null)
		{
			super(name);
		}
		
		
		/*
		 * 
		 * VALID
		 * 
		 */
		protected function isValid():Boolean
		{
			return false;
		}
	}
}