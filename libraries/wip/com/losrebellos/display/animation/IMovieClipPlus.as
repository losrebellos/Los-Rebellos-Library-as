package com.losrebellos.display.animation
{
	import com.losrebellos.display.base.ISpritePlus;
	import flash.display.FrameLabel;
	import flash.display.IMovieClip;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IMovieClipPlus extends IMovieClip, ISpritePlus
	{
		function getFrameByLabel(name:String):int;
		function getLabelByFrame(frame:int):String;
		function getFrameLabel(frame:Object = null):FrameLabel;
		
		function get state():String;
		
		function goto(frame : Object, scene : String = null):void;
		
		function playBackward():void;
		function gotoAndPlayBackward(frame : Object, scene : String = null):void;
		
		function loop(loop:int = 1):void;
		function gotoAndLoop(frame:Object, scene:String = null, loop:int = 1):void;
		function loopBackward(loop:int = 1):void;
		function gotoAndLoopBackward(frame:Object, scene:String = null, loop:int = 1):void;
		
		function playTo(frame : Object, scene : String = null, loop:int = 1):void;
		function gotoAndPlayTo(start_frame : Object, end_frame : Object, scene : String = null, loop:int = 1):void;
	}
}