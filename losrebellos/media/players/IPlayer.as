package losrebellos.media.players 
{
	import losrebellos.media.stream.VideoStream;		
	/*
	 *
	 * @author los rebellos
	 *
	 */
	public interface IPlayer
	{
		function getPercentLoaded():Number;
		function getPercentPlayed():Number;
		
		function load(_video_stream:VideoStream):void;
		function play(_percent:Number = 0, _loop:int = 1):void;
		function resume():void;
		function pause():void;
		function stop():void;
		function seek(_percent:Number):void;
	}
}