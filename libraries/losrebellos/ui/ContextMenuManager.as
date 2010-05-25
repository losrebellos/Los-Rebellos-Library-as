package losrebellos.ui 
{
	import losrebellos.utils.ArrayUtils;

	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuBuiltInItems;
	import flash.ui.ContextMenuItem;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class ContextMenuManager 
	{
		/*
		 *
		 * VARIABLES
		 *
		 */
		private static const _content_menu:ContextMenu = new ContextMenu();
		
		
		/*
		 * 
		 * CONTEXT MENU
		 * 
		 */
		public static function getContextMenu():ContextMenu
		{
			return _content_menu;
		}
		
		
		/*
		 * 
		 * BUILT IN ITEMS
		 * 
		 */
		public static function setContextMenuBuiltInItems(forwardAndBack:Boolean, loop:Boolean, play:Boolean, print:Boolean, quality:Boolean, rewind:Boolean, save:Boolean, zoom:Boolean):ContextMenuBuiltInItems
		{
			var built_in_items:ContextMenuBuiltInItems = new ContextMenuBuiltInItems();
			built_in_items.forwardAndBack = forwardAndBack;
			built_in_items.loop = loop;
			built_in_items.play = play;
			built_in_items.print = print;
			built_in_items.quality = quality;
			built_in_items.rewind = rewind;
			built_in_items.save = save;
			built_in_items.zoom = zoom;
			
			_content_menu.builtInItems = built_in_items;
			_content_menu.hideBuiltInItems();
			
			return built_in_items;
		}
		public static function hideBuiltInItems():void
		{
			_content_menu.hideBuiltInItems();
		}
		
		
		/*
		 *
		 * ADD ITEMS
		 *
		 */
		public static function addSimpleContextMenuItem(caption:String, separatorBefore:Boolean = false):ContextMenuItem
		{
			var item:ContextMenuItem = new ContextMenuItem(caption);
			item.enabled = false;
			item.separatorBefore = separatorBefore;
			
			_content_menu.customItems.push(item);
			
			return item;
		}
		public static function addContextMenuItem(item:ContextMenuItem, item_select:Function = null):int
		{
			if(item_select != null)
			{
				_content_menu.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, item_select, false, 0, true);
			}
			
			_content_menu.customItems.push(item);
			
			return _content_menu.customItems.length - 1;
		}
		public static function removeContextMenuItem(i:int):void
		{
			_content_menu.customItems = ArrayUtils.remove(_content_menu.customItems, i);
		}
	}
}