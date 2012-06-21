package com.losrebellos.project.framework.robotlegs.plugin.statemachine.view
{
	import com.bit101.components.Style;
	import com.bit101.components.Window;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public class StateMachineDebug extends Window
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function StateMachineDebug()
		{
			Style.PANEL = 0x333333;
			Style.BACKGROUND = 0x333333;
			Style.INPUT_TEXT = 0xEEEEEE;
			Style.LABEL_TEXT = 0xEEEEEE;
			Style.BUTTON_FACE = 0x555555;
			Style.DROPSHADOW = 0x000000;
			Style.TEXT_BACKGROUND = 0x333333;

			super(null, 0, 0, "STATE MACHINE");

			this.draggable = true;
			this.hasMinimizeButton = true;
		}
	}
}