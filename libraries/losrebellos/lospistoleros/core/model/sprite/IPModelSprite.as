package losrebellos.lospistoleros.core.model.sprite 
{
	import losrebellos.lospistoleros.core.controller.sprite.IPControllerSprite;
	import losrebellos.lospistoleros.core.model.IPModel;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IPModelSprite extends IPModel
	{
		function setView(v:IPViewSprite):void;
		function getView():IPViewSprite;
		
		function setController(c:IPControllerSprite):void;
		function getController():IPControllerSprite;
	}
}