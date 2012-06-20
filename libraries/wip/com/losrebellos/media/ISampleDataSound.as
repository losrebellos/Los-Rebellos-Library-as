package com.losrebellos.media
{
	import com.anttikupila.media.filters.IFilter;
	import com.losrebellos.interfaces.IDisposable;
	import com.losrebellos.media.filter.soundtransform.ISoundTransformFilter;
	import flash.media.ISound;
	import flash.media.SoundChannel;





	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ISampleDataSound extends ISound, IDisposable
	{
		function set speed(value:Number):void;
		function get speed():Number;
		
		function get channel():SoundChannel;
		
		function stop():void;
		function pause():void;
		function resume():void;
		
		function get progress():Number;
		
		function get completedLoop():int;
		
		function set filters(value:Vector.<IFilter>):void;
		function set channelFilters(value:Vector.<ISoundTransformFilter>):void;
	}
}