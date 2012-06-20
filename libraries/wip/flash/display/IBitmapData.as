package flash.display
{
	import flash.filters.BitmapFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;

	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface IBitmapData extends IBitmapDrawable
	{
		function get width():int;
		function get height():int;
		
		function get rect():Rectangle;
		function get transparent():Boolean;
		
		
		function setPixel(x:int, y:int, color:uint):void;
		function getPixel(x:int, y:int):uint;
		function setPixel32(x:int, y:int, color:uint):void;
		function getPixel32(x:int, y:int):uint;
		function setPixels(rect:Rectangle, inputByteArray:ByteArray):void;
		function getPixels(rect:Rectangle):ByteArray;
		
		function copyPixels(sourceBitmapData:BitmapData, sourceRect:Rectangle, destPoint:Point, alphaBitmapData:BitmapData = null, alphaPoint:Point = null, mergeAlpha:Boolean = false):void;
		
		function copyChannel(sourceBitmapData:BitmapData, sourceRect:Rectangle, destPoint:Point, sourceChannel:uint, destChannel:uint):void;
		
		
		function draw(source:IBitmapDrawable, matrix:Matrix = null, colorTransform:ColorTransform = null, blendMode:String = null, clipRect:Rectangle = null, smoothing:Boolean = false):void;
		function clone():BitmapData;
		function dispose():void;
		
		
		function lock():void;
		function unlock(changeRect:Rectangle = null):void;
		
		
		function applyFilter(sourceBitmapData:BitmapData, sourceRect:Rectangle, destPoint:Point, filter:BitmapFilter):void;
		
		function colorTransform(rect:Rectangle, colorTransform:ColorTransform):void;
		
		function compare(otherBitmapData:BitmapData):Object;
		
		function merge(sourceBitmapData:BitmapData, sourceRect:Rectangle, destPoint:Point, redMultiplier:uint, greenMultiplier:uint, blueMultiplier:uint, alphaMultiplier:uint):void;
		
		function noise(randomSeed:int, low:uint = 0, high:uint = 255, channelOptions:uint = 7, grayScale:Boolean = false):void;
		
		function paletteMap(sourceBitmapData:BitmapData, sourceRect:Rectangle, destPoint:Point, redArray:Array = null, greenArray:Array = null, blueArray:Array = null, alphaArray:Array = null):void;
		
		function perlinNoise(baseX:Number, baseY:Number, numOctaves:uint, randomSeed:int, stitch:Boolean, fractalNoise:Boolean, channelOptions:uint = 7, grayScale:Boolean = false, offsets:Array = null):void;
		
		function pixelDissolve(sourceBitmapData:BitmapData, sourceRect:Rectangle, destPoint:Point, randomSeed:int = 0, numPixels:int = 0, fillColor:uint = 0):int;

		function threshold(sourceBitmapData:BitmapData, sourceRect:Rectangle, destPoint:Point, operation:String, threshold:uint, color:uint = 0, mask:uint = 4.294967295E9, copySource:Boolean = false):uint;
		
		function scroll(x:int, y:int):void;
		
		function floodFill(x:int, y:int, color:uint):void;
		
		function histogram(hRect:Rectangle = null):Vector.<Vector.<Number>>;
		
		function fillRect(rect:Rectangle, color:uint):void;
		function generateFilterRect(sourceRect:Rectangle, filter:BitmapFilter):Rectangle;
		
		function getColorBoundsRect(mask:uint, color:uint, findColor:Boolean = true):Rectangle;
		
		function hitTest(firstPoint:Point, firstAlphaThreshold:uint, secondObject:Object, secondBitmapDataPoint:Point = null, secondAlphaThreshold:uint = 1):Boolean;
		
		
		function setVector(rect:Rectangle, inputVector:Vector.<uint>):void;
		function getVector(rect:Rectangle):Vector.<uint>;
	}
}