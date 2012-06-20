package com.losrebellos.project.losbanditos 
{
	import flash.utils.Dictionary;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class LosBanditosLibrary 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// VARIABLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static var _references:Dictionary = new Dictionary(true);
		private static var _tweens:Vector.<LosBanditosTween> = new Vector.<LosBanditosTween>();
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// MANAGE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function addTween(object:Object, lbt:LosBanditosTween):void
		{
			_tweens.push(lbt);
			
			var references:Dictionary;
			if(_references[object])
			{
				references = _references[object];
			}
			else
			{
				_references[object] = references = new Dictionary(true);
			}
			references[object] = lbt;
		}
		public static function getTween(i:int):LosBanditosTween
		{
			return _tweens[i];
		}
		public static function removeTweenByObject(object:Object):Boolean
		{
			var lbts:Vector.<LosBanditosTween> = _references[object];
			if(lbts)
			{
				var lbt:LosBanditosTween;
				for each(lbt in lbts)
				{
					delete _tweens[_tweens.indexOf(lbt)];
					_tweens.splice(_tweens.indexOf(lbt), 1);
					delete _references[object];
					_references[object] = null;
				}
				
				return true;
			}
			
			return false;
		}
		public static function removeTweenByIndex(i:int):void
		{
			delete _tweens[i];
			var lbt:LosBanditosTween = _tweens[i];
			_tweens.splice(i, 1);
			lbt = null;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// UTILS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function get length():int
		{
			return _tweens.length;
		}
		public static function empty():void
		{
			_references = null;
			_references = new Dictionary(true);
			
			_tweens.length = 0;
			_tweens = null;
			_tweens = new Vector.<LosBanditosTween>();
		}
	}
}