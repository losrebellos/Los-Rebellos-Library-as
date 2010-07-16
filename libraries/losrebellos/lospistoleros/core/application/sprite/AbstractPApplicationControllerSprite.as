package losrebellos.lospistoleros.core.application.sprite 
{
	import losrebellos.lospistoleros.core.controller.sprite.PControllerSprite;
	import losrebellos.lospistoleros.core.model.sprite.IPModelSprite;
	import losrebellos.lospistoleros.core.view.IPView;
	import losrebellos.lospistoleros.core.view.sprite.IPViewSprite;

	import flash.display.LoaderInfo;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class AbstractPApplicationControllerSprite extends PControllerSprite 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		protected var _loaderInfo:LoaderInfo = null;
		protected var _parameters:Object = null;
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function AbstractPApplicationControllerSprite(m:IPModelSprite, v:IPViewSprite = null, name:String = null)
		{
			super(m, v, name);
		}
		
		
		/*
		 * 
		 * VIEW
		 * 
		 */
		override protected function saveView(v:IPView):void
		{
			super.saveView(v);
			
			if(_view.parent)
			{
				_loaderInfo = _view.parent.loaderInfo;
				_parameters = _loaderInfo.parameters;
			}
		}

		
		/*
		 * 
		 * FLASH VARS
		 * 
		 */
		protected function getFlashVars(name:String):Object
		{
			return _view.parent.loaderInfo.parameters[name];
		}
	}
}