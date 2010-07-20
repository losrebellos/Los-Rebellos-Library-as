package losrebellos.lospistoleros.core.model.vo 
{
	import flash.errors.IllegalOperationError;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BasePXMLVO extends BasePVO 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		public var data:XML = null;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function BasePXMLVO(data:XML, name:String = null, type:String = null)
		{
			super(name, type);
			
			this.data = data;
			
			parse(data);
		}
		
		
		/*
		 * 
		 * PARSE THE XML
		 * 
		 */
		protected function parse(data:XML):void
		{
			throw new IllegalOperationError(">>> BasePXMLVO:parse need to be overridden!!!");
		}
	}
}