package losrebellos.display {	import flash.display.FrameLabel;	import flash.display.Scene;	/*	 *	 * @author los rebellos	 *	 */	public interface IMovieClipPlus extends ISpritePlus	{		/*		 * 		 * DEFAULT		 * 		 */		function get currentLabels() : Array;		function stop() : void;		function get currentLabel() : String;		function get totalFrames() : int;		function prevScene() : void;		function play() : void;		function addFrameScript(...args) : void;		function nextFrame() : void;		function get enabled() : Boolean;		function get framesLoaded() : int;		function get scenes() : Array;		function nextScene() : void;		function get currentFrame() : int;		function set enabled(value : Boolean) : void;		function gotoAndStop(frame : Object, scene : String = null) : void;		function get currentScene() : Scene;		function set trackAsMenu(value : Boolean) : void;		function gotoAndPlay(frame : Object, scene : String = null) : void;		function get trackAsMenu() : Boolean;		function prevFrame() : void;						/*		 * 		 * CUSTOM		 * 		 */		function getFrameByLabel(name:String):int;		function getLabelByFrame(frame:int):String;		function get currentFrameLabel():FrameLabel;		function getFrameLabel(frame:Object):FrameLabel;				function playBackward():void;		function gotoAndPlayBackward(frame : Object, scene : String = null):void;				function loop(loop:int = 1):void;		function gotoAndLoop(frame:Object, scene:String = null, loop:int = 1):void;		function loopBackward(loop:int = 1):void;		function gotoAndLoopBackward(frame:Object, scene:String = null, loop:int = 1):void;				function playTo(frame : Object, scene : String = null, loop:int = 1):void;		function gotoAndPlayTo(start_frame : Object, end_frame : Object, scene : String = null, loop:int = 1):void;	}}