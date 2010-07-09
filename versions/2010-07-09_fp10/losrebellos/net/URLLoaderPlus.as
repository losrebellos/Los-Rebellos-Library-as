package losrebellos.net 
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class URLLoaderPlus extends URLLoader 
	{
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function URLLoaderPlus(request:URLRequest = null)
		{
			super(request);
		}
		
		
		/*
		 * 
		 * UTILS
		 * 
		 */
		protected function getDataAs(c:Class):*
		{
			return c(this.data);
		}
		public function getXMLData():XML
		{
			return this.getDataAs(XML);
		}
	}
}