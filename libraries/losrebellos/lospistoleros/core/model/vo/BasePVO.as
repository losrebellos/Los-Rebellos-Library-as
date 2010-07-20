package losrebellos.lospistoleros.core.model.vo 
{
	import losrebellos.lospistoleros.core.accessor.PAccessorObject;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BasePVO extends PAccessorObject 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function BasePVO(name:String = null, type:String = null)
		{
			super(name, type);
		}
	}
}