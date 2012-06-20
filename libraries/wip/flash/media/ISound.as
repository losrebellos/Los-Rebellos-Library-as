package flash.media
{
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ISound extends IEventDispatcher
	{
		function get url():String;
		function get isURLInaccessible():Boolean;
		function get isBuffering():Boolean;
		function load(stream:URLRequest, context:SoundLoaderContext = null):void;
		function close():void;
		function get bytesTotal():int;
		function get bytesLoaded():uint;
		
		function get id3():ID3Info;
		function get length():Number;
		
		function play(startTime:Number = 0, loops:int = 0, sndTransform:SoundTransform = null):SoundChannel;
		function extract(target:ByteArray, length:Number, startPosition:Number = -1):Number;
	}
}