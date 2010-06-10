package losrebellos.media.players 
{
	import losrebellos.media.stream.IStream;

	import flash.media.SoundTransform;

	/*
	 *
	 * @author los rebellos
	 *
	 */
	public interface IPlayer
	{
		function set streamSoundTransform(value:SoundTransform):void;
		function get streamSoundTransform():SoundTransform;
		
		function getPercentLoaded():Number;
		function getPercentPlayed():Number;
		
		function load(_stream:IStream):void;
		function unLoad():void;
		
		function play(percent:Number = 0, loop:int = 0):void;
		function resume():void;
		function pause():void;
		function stop():void;
		function seek(_percent:Number):void;
		
		function setStream(value:IStream):void;
		function getStream():IStream;
		function destroyStream():void;
	}
}