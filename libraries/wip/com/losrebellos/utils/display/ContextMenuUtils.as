package com.losrebellos.utils.display 
{
	import com.losrebellos.utils.collection.ArrayUtils;

	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuBuiltInItems;
	import flash.ui.ContextMenuItem;


	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public final class ContextMenuUtils 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// CONSTANTS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private static const _CONTEXT_MENU:ContextMenu = new ContextMenu();
		public static function get CONTEXT_MENU():ContextMenu
		{
			return _CONTEXT_MENU;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// BUILT IN ITEMS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function setContextMenuBuiltInItems(forwardAndBack:Boolean, loop:Boolean, play:Boolean, print:Boolean, quality:Boolean, rewind:Boolean, save:Boolean, zoom:Boolean):ContextMenuBuiltInItems
		{
			var builtInItems:ContextMenuBuiltInItems = new ContextMenuBuiltInItems();
			builtInItems.forwardAndBack = forwardAndBack;
			builtInItems.loop = loop;
			builtInItems.play = play;
			builtInItems.print = print;
			builtInItems.quality = quality;
			builtInItems.rewind = rewind;
			builtInItems.save = save;
			builtInItems.zoom = zoom;
			
			_CONTEXT_MENU.builtInItems = builtInItems;
			_CONTEXT_MENU.hideBuiltInItems();
			
			return builtInItems;
		}
		public static function hideBuiltInItems():void
		{
			_CONTEXT_MENU.hideBuiltInItems();
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// ITEMS
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function addSimpleContextMenuItem(caption:String, separatorBefore:Boolean = false):ContextMenuItem
		{
			var item:ContextMenuItem = new ContextMenuItem(caption);
			item.enabled = false;
			item.separatorBefore = separatorBefore;
			
			_CONTEXT_MENU.customItems.push(item);
			
			return item;
		}
		public static function addContextMenuItem(item:ContextMenuItem, itemSelect:Function = null):int
		{
			if(itemSelect != null)
			{
				_CONTEXT_MENU.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, itemSelect, false, 0, true);
			}
			
			_CONTEXT_MENU.customItems.push(item);
			
			return _CONTEXT_MENU.customItems.length - 1;
		}
		public static function removeContextMenuItem(i:int):void
		{
			_CONTEXT_MENU.customItems = ArrayUtils.remove(_CONTEXT_MENU.customItems, i);
		}
	}
}