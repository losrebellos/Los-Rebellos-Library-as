package losrebellos.lospistoleros.core.controller.sprite 
{
	import losrebellos.lospistoleros.core.controller.IPController;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPControllerSprite extends IPController
	{
		function setModel(m:IPModelSprite):void;
		function getModel():IPModelSprite;
		
		function setView(v:IPViewSprite):void;
		function getView():IPViewSprite;
	}
}