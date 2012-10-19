package com.losrebellos.project.framework.robotlegs.plugin.statemachine.view
{
	import com.bit101.components.Component;
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.losrebellos.project.framework.robotlegs.plugin.statemachine.constants.StateMachinePluginConstants;

	import org.robotlegs.utilities.statemachine.StateEvent;

	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class StateMachineDebugController extends BaseStateMachineController
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function StateMachineDebugController()
		{
			super();
		}
		private function get _view():StateMachineDebug
		{
			return viewComponent as StateMachineDebug;
		}
		override public function onRegister():void
		{
			super.onRegister();
			
			_states = fsmInjector.xml["state"];
		}
		override public function onRemove():void
		{
			// nothing
			// so it won't remove the state changed event listener
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// HANDLERS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private const TRANSITION:String = "transition";
		private const LABEL_FOR:String = "for ";
		private var _states:XMLList;
		override protected function onStateChanged(e:StateEvent):void
		{
			// remove all the buttons
			var d:DisplayObject;
			while(_view.content.numChildren)
			{
				d = _view.content.removeChildAt(0);
				d.removeEventListener(MouseEvent.CLICK, onPushButtonClicked);
			}
			
			// change the title
			_view.title = fsm.currentStateName;
			
			// put the new buttons
			var maxWidth:Number = 0;
			var maxHeight:Number = StateMachinePluginConstants.DEBUG_MARGIN;
			
			// transitions
			var stateXML:XML = (_states.(@name == fsm.currentStateName))[0];
			if(stateXML)
			{
				var transitionList:XMLList = stateXML[TRANSITION];
				var transitionXML:XML;
				var label:Label;
				var button:PushButton;
				for each(transitionXML in transitionList)
				{
					button = new PushButton(_view, StateMachinePluginConstants.DEBUG_MARGIN, maxHeight, transitionXML.@action, onPushButtonClicked);
					button.width = 200;
					label = new Label(_view, button.x + button.width + StateMachinePluginConstants.DEBUG_MARGIN / 2, maxHeight + 1, LABEL_FOR + transitionXML.@target);
					
					maxWidth = (label.x + label.width > maxWidth) ? (label.x + label.width) : maxWidth;
					maxHeight += button.height + StateMachinePluginConstants.DEBUG_MARGIN / 2;
				}
			}
			
			// resize
			_view.width = maxWidth + StateMachinePluginConstants.DEBUG_MARGIN;
			_view.height = maxHeight + StateMachinePluginConstants.DEBUG_MARGIN / 2 + _view.titleBar.height;
			
			// draw
			_view.dispatchEvent(new Event(Component.DRAW));
		}
		private function onPushButtonClicked(e:MouseEvent):void
		{
			dispatch(new StateEvent(StateEvent.ACTION, (e.target as PushButton).label));
		}
	}
}