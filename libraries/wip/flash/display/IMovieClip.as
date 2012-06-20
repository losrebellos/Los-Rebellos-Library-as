package flash.display
{

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IMovieClip extends ISprite
	{
		function set enabled(value:Boolean):void;
		function get enabled():Boolean;
		
		
		function set trackAsMenu(value:Boolean):void;
		function get trackAsMenu():Boolean;
		
		
		function get currentLabel():String;
		function get currentLabels():Array;
		
		function get currentFrame():int;
		function get totalFrames():int;
		function get framesLoaded():int;
		
		function get currentScene():Scene;
		function get scenes():Array;
		
		
		function prevFrame():void;
		function nextFrame():void;
		function prevScene():void;
		function nextScene():void;
		
		
		function addFrameScript(...args):void;
		
		
		function play():void;
		function gotoAndPlay(frame:Object, scene:String = null):void;
		function gotoAndStop(frame:Object, scene:String = null):void;
		function stop():void;
	}
}