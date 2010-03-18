package losrebellos.scale {	import flash.geom.Rectangle;	/*	 *	 * @author los rebellos	 *	 */	public class Fit 	{		/*		 * 		 * GET THE RECTANGLE TO FIT		 * 		 */		public static function getFittedRectangle(_fit_type:String, _rect_object:Rectangle, _rect_resize:Rectangle):Rectangle		{			var result_rect:Rectangle = new Rectangle;			var _rect_object_ratio:Number = _rect_object.width / _rect_object.height;			var _rect_resize_ratio:Number = _rect_resize.width / _rect_resize.height;						//fit inside			if(_fit_type == FitType.INSIDE)			{				if(_rect_resize_ratio > _rect_object_ratio)				{					result_rect.width = _rect_resize.height * _rect_object_ratio;					result_rect.height = _rect_resize.height;				}				else				{					result_rect.width = _rect_resize.width;					result_rect.height = _rect_resize.width / _rect_object_ratio;				}			}						//fit inside outside			else if(_fit_type == FitType.OUTSIDE)			{				if(_rect_resize_ratio > _rect_object_ratio)				{					result_rect.width = _rect_resize.width;					result_rect.height = _rect_resize.width / _rect_object_ratio;				}				else				{					result_rect.width = _rect_resize.height * _rect_object_ratio;					result_rect.height = _rect_resize.height;				}			}						//fit width			else if(_fit_type == FitType.WIDTH)			{				result_rect.width = _rect_resize.width;				result_rect.height = _rect_resize.width / _rect_object_ratio;			}						//fit height			else if(_fit_type == FitType.HEIGHT)			{				result_rect.width = _rect_resize.height * _rect_object_ratio;				result_rect.height = _rect_resize.height;			}						return result_rect;		}	}}