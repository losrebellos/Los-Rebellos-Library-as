package losrebellos.lospistoleros.core.accessor 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPAccessor 
	{
		function set NAME(value:String):void;
		function get NAME():String;
		
		function set TYPE(value:String):void;
		function get TYPE():String;
	}
}