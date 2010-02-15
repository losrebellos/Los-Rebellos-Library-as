package losrebellos.media.players 
{
	import losrebellos.media.stream.IStream;					/*
	 *
	 * @author los rebellos
	 *
	 */
	public interface IPlayer
	{
		function getPercentLoaded():Number;
		function getPercentPlayed():Number;
		
		function load(_stream:IStream):void;
		function play(percent:Number = 0, loop:int = 0):void;
		function resume():void;
		function pause():void;
		function stop():void;
		function seek(_percent:Number):void;
		
		function destroyStream():void;
	}
}