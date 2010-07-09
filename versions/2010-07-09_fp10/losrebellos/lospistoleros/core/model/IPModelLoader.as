package losrebellos.lospistoleros.core.model 
{
	import flash.net.URLRequest;
	import flash.system.LoaderContext;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPModelLoader extends IPModel 
	{
		function load(request:URLRequest, context:LoaderContext = null):void;
	}
}