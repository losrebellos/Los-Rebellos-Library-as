package flash.display
{
	import flash.geom.Rectangle;
	import flash.media.SoundTransform;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ISprite extends IDisplayObjectContainer
	{
		function set buttonMode(value:Boolean):void;
		function get buttonMode():Boolean;
		
		function set useHandCursor(value:Boolean):void;
		function get useHandCursor():Boolean;
		
		
		function get dropTarget():DisplayObject;
		
		
		function get graphics():Graphics;
		
		
		function set hitArea(value:Sprite):void;
		function get hitArea():Sprite;
		
		
		function set soundTransform(sndTransform:SoundTransform):void;
		function get soundTransform():SoundTransform;
		
		
		function startDrag(lockCenter:Boolean = false, bounds:Rectangle = null):void;
		function stopDrag():void;
	}
}