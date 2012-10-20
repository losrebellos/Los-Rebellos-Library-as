package com.losrebellos.project.framework.base.mvcs
{
	import flash.events.Event;

	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public class ViewContainer extends View implements IViewContainer
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function ViewContainer()
		{
			super();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// INVALIDATE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function resize():void
		{
			resizeChildren();
		}
		override public function render():void
		{
			renderChildren();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// DISPOSE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function dispose(e:Event = null):void
		{
			disposeChildren(e);
			removeChildren();
			
			super.dispose(e);
		}
	}
}