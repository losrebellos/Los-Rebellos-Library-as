package losrebellos.lospistoleros.core.view.sprite 
{
	import losrebellos.display.ISpritePlus;
	import losrebellos.lospistoleros.core.controller.sprite.IPControllerSprite;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;
	import losrebellos.lospistoleros.core.view.IPView;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPViewSprite extends IPView, ISpritePlus 
	{
		function setModel(m:IPModelSprite):void;
		function getModel():IPModelSprite;
		
		function setController(c:IPControllerSprite):void;
		function getController():IPControllerSprite;
	}
}