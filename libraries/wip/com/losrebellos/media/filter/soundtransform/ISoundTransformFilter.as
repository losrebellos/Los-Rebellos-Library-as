package com.losrebellos.media.filter.soundtransform
{
	import flash.media.SoundTransform;
	/**
	 * @author Los Rebellos (Benoit Vinay)
	 */
	public interface ISoundTransformFilter
	{
		function set soundTransform(value:SoundTransform):void;
		
		function process():void;
	}
}