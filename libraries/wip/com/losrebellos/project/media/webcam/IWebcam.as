package com.losrebellos.project.media.webcam
{
	import com.losrebellos.events.IEventDispatcherPlus;
	import com.losrebellos.interfaces.IInteractive;
	import flash.media.Camera;
	import flash.media.Video;



	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IWebcam extends IInteractive, IEventDispatcherPlus
	{
		function get camera():Camera;
		function get defaultVideo():Video;
		
		// default
		function get activityLevel():Number;
		function get bandwidth():int;
		function get currentFPS():Number;
		function get fps():Number;
		function get index():int;
		function get keyFrameInterval():int;
		function get loopback():Boolean;
		function get motionLevel():int;
		function get motionTimeout():int;
		function get muted():Boolean;
		function get name():String;
		function get quality():int;
		function setCursor(value:Boolean):void;
		function setKeyFrameInterval(keyFrameInterval:int):void;
		function setLoopback(compress:Boolean = false):void;
		function setMode(width:int, height:int, fps:Number, favorArea:Boolean = true):void;
		function setMotionLevel(motionLevel:int, timeout:int = 2000):void;
		function setQuality(bandwidth:int, quality:int):void;
		function get width():int;
		function get height():int;
	}
}