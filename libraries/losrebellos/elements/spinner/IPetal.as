package losrebellos.elements.spinner 
{
	import losrebellos.display.ISpritePlus;
	import losrebellos.interfaces.IInteraction;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPetal extends ISpritePlus, IInteraction
	{
		function progress(percent:Number):void
	}
}