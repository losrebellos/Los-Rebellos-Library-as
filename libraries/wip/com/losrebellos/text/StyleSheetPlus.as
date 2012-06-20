package com.losrebellos.text 
{
	import com.losrebellos.old.css.TextFormats;
	import flash.text.StyleSheet;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class StyleSheetPlus extends StyleSheet implements IStyleSheetPlus
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTRUCTOR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public function StyleSheetPlus(CSSText:String, id:String = null)
		{
			super();
			
			// parse
			parseCSS(CSSText);
			
			// register the StyleSheet
			if(id)
			{
				TextFormats.instance.registerStyleSheet(id, this);
			}
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// EVENTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
	}
}