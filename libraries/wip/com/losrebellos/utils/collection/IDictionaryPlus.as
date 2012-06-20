package com.losrebellos.utils.collection 
{

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public interface IDictionaryPlus 
	{
		function add(key:Object, value:Object):Boolean;
		function tryAdding(key:Object, value:Object):Object;
		function remove(key:Object):Boolean;
		
		function apply(_function:String, ...args):void;
		
		function get length():int;
		
		function hasKey(key:Object):Boolean;
		function getKey(key:Object):Object;
		function getKeys():Array;
		function getValues():Array;
		
		function isEmpty():Boolean;
		function empty():Boolean;
		
		function clone():DictionaryPlus;
		function toString():String;
	}
}