package com.losrebellos.project.media.youtube
{
	import com.losrebellos.display.base.ISpritePlus;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IYoutubePlayer extends ISpritePlus
	{
		function play(id:String, width:int = 480, height:int = 360):void
		function stop():void;
		function pause():void;
		function resume():void;
		
		function get state():int;
	}
}