package losrebellos.display.base 
{
	import losrebellos.display.MovieClipPlus;
	import losrebellos.interfaces.IPlus;
	import losrebellos.utils.DictionaryPlus;

	import flash.display.DisplayObject;
	import flash.geom.Rectangle;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 *
	 */
	public class BaseMovieClipContainer extends MovieClipPlus 
	{
		/*
		 * 
		 * VARIABLES
		 * 
		 */
		protected var _childs:DictionaryPlus = new DictionaryPlus(true);
		
		
		/*
		 *
		 * CONSTRUCTOR
		 *
		 */
		public function BaseMovieClipContainer()
		{
			super();
		}
		
		
		/*
		 * 
		 * CHILD
		 * 
		 */
		override public function addChild(child:DisplayObject):DisplayObject
		{
			_childs.add(child, child);
			
			return super.addChild(child);
		}
		
		
		/*
		 *
		 * RESIZE
		 *
		 */
		override public function resize(rect:Rectangle):void
		{
			super.resize(rect);
			
			for each(var child:DisplayObject in _childs)
			{
				if(child is IPlus)
				{
					(child as IPlus).resize(rect);
				}
			}
		}
	}
}