package losrebellos.display 
{
	import losrebellos.interfaces.IGraphics;

	import flash.display.Graphics;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IShapePlus extends IGraphics, IDisplayObjectPlus 
	{
		function get graphics():Graphics;
	}
}