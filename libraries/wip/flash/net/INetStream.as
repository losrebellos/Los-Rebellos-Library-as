package flash.net 
{
	import flash.events.IEventDispatcher;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.SoundTransform;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface INetStream extends IEventDispatcher 
	{
		function attachAudio(microphone:Microphone):void;

		
		function attachCamera(theCamera:Camera, snapshotMilliseconds:int = -1):void;

		
		function get audioCodec():uint;

		
		function get bufferLength():Number;

		
		function get bufferTime():Number;

		
		function set bufferTime(bufferTime:Number):void;

		
		function get bytesLoaded():uint;

		
		function get bytesTotal():uint;

		
		function get checkPolicyFile():Boolean;

		
		function set checkPolicyFile(state:Boolean):void;

		
		function get client():Object;

		
		function set client(object:Object):void;

		
		function close():void;

		
		function get currentFPS():Number;

		
		function get decodedFrames():uint;

		
		function get farID():String;

		
		function get farNonce():String;

		
		function get info():NetStreamInfo;

		
		function get liveDelay():Number;

		
		function get maxPauseBufferTime():Number;

		
		function set maxPauseBufferTime(pauseBufferTime:Number):void;

		
		function get nearNonce():String;

		
		function get objectEncoding():uint;

		
		function onPeerConnect(subscriber:NetStream):Boolean;

		
		function pause():void;

		
		function get peerStreams():Array;

		
		function play(...args:*):void;

		
		function play2(param:NetStreamPlayOptions):void;

		
		function publish(name:String = null, type:String = null):void;

		
		function receiveAudio(flag:Boolean):void;

		
		function receiveVideo(flag:Boolean):void;

		
		function receiveVideoFPS(FPS:Number):void;

		
		function resume():void;

		
		function seek(offset:Number):void;

		
		function send(handlerName:String, ...args:*):void;

		
		function get soundTransform():SoundTransform;

		
		function set soundTransform(sndTransform:SoundTransform):void;

		
		function get time():Number;

		
		function togglePause():void;

		
		function get videoCodec():uint;
	}
}