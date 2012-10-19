package com.losrebellos.project.framework.base.application.preloader
{
	import com.losrebellos.project.framework.base.application.IApplication;
	import com.losrebellos.project.framework.base.application.SimpleApplication;

	import flash.display.DisplayObject;
	import flash.errors.IllegalOperationError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.utils.getDefinitionByName;


	/**
	 * @author Benoit vinay - ben@benoitvinay.com
	 */
	public class BaseApplicationPreloader extends SimpleApplication implements IApplicationPreloader
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function BaseApplicationPreloader()
		{
			super();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STAGE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override protected function onAddedToStage(e:Event):void
		{
			addLoadNeverCompletedHandler();
			
			super.onAddedToStage(e);
			
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONTENT
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override protected function createContent():void
		{
			throw new IllegalOperationError("_preloaderView shouldn't be null");
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// handles Error #2044: Unhandled IOErrorEvent:. text=Error #2036: Load Never Completed
		// ( happens in some browsers when refresh is clicked while loading )
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected function addLoadNeverCompletedHandler():void
		{
			root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}
		protected function onIOError(event:IOErrorEvent):void
		{
			root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
			trace(event.text);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// PROGRESS / COMPLETE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _preloaderView:IApplicationPreloaderView;
		public function get preloaderView():IApplicationPreloaderView
		{
			return _preloaderView;
		}
		protected function onEnterFrame(e:Event):void
		{
			_preloaderView.progress = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
			
			onProgress();
			
			if(_preloaderView.progress >= 1)
			{
				stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				onComplete();
			}
		}
		protected function onProgress():void
		{
			
		}
		protected function onComplete():void
		{
			start();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// START
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		protected var _ApplicationClass:String;
		protected var _application:IApplication;
		protected function start():void
		{
			var ApplicationClass:Class = getDefinitionByName(_ApplicationClass) as Class;
			_application = new ApplicationClass();
			_application.preloader = this;
			addChildAt(_application as DisplayObject, 0);
		}
	}
}