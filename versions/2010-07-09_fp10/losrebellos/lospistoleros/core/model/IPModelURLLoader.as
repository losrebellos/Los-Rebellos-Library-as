package losrebellos.lospistoleros.core.model 
{
	import flash.net.URLRequest;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPModelURLLoader extends IPModel
	{
		function load(request:URLRequest):void;
	}
}