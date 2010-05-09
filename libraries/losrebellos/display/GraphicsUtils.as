package losrebellos.display 
{
	import flash.display.Sprite;

	/*
	 *
	 * @author los rebellos - ben@benoitvinay.com
	 * 
	 * This class is based on code written by Ric Ewing (www.ricewing.com).
	 * See the details at http://www.adobe.com/devnet/flash/articles/adv_draw_methods.html.
	 * I made several changes including the sending the target Sprite to the function.
	 * Usage: Wedge.draw(mySprite, 350, 200, 100, arcAngle);
	 *
	 */
	public class GraphicsUtils 
	{
		/*
		 * 
		 * WEDGE
		 * 
		 */
		//circle
		public static function drawWedgeCircle(s:Sprite, x:Number, y:Number, startAngle:Number, arc:Number, radius:Number, close:Boolean = true):void
		{
			drawWedgeEllipse(s, x, y, startAngle, arc, radius, radius, close);
		}

		
		//ellipse
		public static function drawWedgeEllipse(s:Sprite, x:Number, y:Number, startAngle:Number, arc:Number, xRadius:Number, yRadius:Number, close:Boolean = true):void
		{
			if(close)
			{
				s.graphics.moveTo(x, y);
			}
		
			// Init vars
			var segAngle:Number;
			var theta:Number;
			var angle:Number;
			var angleMid:Number;
			var segs:Number;
			var ax:Number;
			var ay:Number;
			var bx:Number;
			var by:Number;
			var cx:Number;
			var cy:Number;
		
			// limit sweep to reasonable numbers
			if (Math.abs(arc) > 360)
			{
				arc = 360;
			}
		
			// Flash uses 8 segments per circle, to match that, we draw in a maximum
			// of 45 degree segments. First we calculate how many segments are needed
			// for our arc.
			segs = Math.ceil(Math.abs(arc) / 45);
		
			// Now calculate the sweep of each segment.
			segAngle = arc / segs;
		
			// The math requires radians rather than degrees. To convert from degrees
			// use the formula (degrees/180)*Math.PI to get radians.
			theta = -(segAngle / 180) * Math.PI;
		
			// convert angle startAngle to radians
			angle = -(startAngle / 180) * Math.PI;
		
			// draw the curve in segments no larger than 45 degrees.
			if (segs > 0) 
			{
				// draw a line from the center to the start of the curve
				ax = x + Math.cos(startAngle / 180 * Math.PI) * xRadius;
				ay = y + Math.sin(-startAngle / 180 * Math.PI) * yRadius;
				if(!close)
				{
					s.graphics.moveTo(ax, ay);
				}
				else
				{
					s.graphics.lineTo(ax, ay);
				}
				
				// Loop for drawing curve segments
				for (var i:int = 0;i < segs;i++) 
				{
					angle += theta;
					angleMid = angle - (theta / 2);
					bx = x + Math.cos(angle) * xRadius;
					by = y + Math.sin(angle) * yRadius;
					cx = x + Math.cos(angleMid) * (xRadius / Math.cos(theta / 2));
					cy = y + Math.sin(angleMid) * (yRadius / Math.cos(theta / 2));
					s.graphics.curveTo(cx, cy, bx, by);
				}
				
				// close the wedge by drawing a line to the center
				if(close)
				{
					s.graphics.lineTo(x, y);
				}
			}
		}

		
		/*
		 * 
		 * STAR
		 * 
		 */
		public static function drawStar(s:Sprite, x:Number, y:Number, points:int, innerRadius:Number, outerRadius:Number, angle:Number):void
		{
			// ==============
			// mc.drawStar() - by Ric Ewing (ric@formequalsfunction.com) - version 1.4 - 4.7.2002
			// 
			// x, y = center of star
			// points = number of points (Math.abs(points) must be > 2)
			// innerRadius = radius of the indent of the points
			// outerRadius = radius of the tips of the points
			// angle = [optional] starting angle in degrees. (defaults to 0)
			// ==============
			var count:int = Math.abs(points);
			if (count > 2) 
			{
				// init vars
				var step:Number;
				var halfStep:Number;
				var start:Number;
				var n:Number;
				var dx:Number;
				var dy:Number;
				
				// calculate distance between points
				step = (Math.PI * 2) / points;
				halfStep = step / 2;
				
				// calculate starting angle in radians
				start = (angle / 180) * Math.PI;
				s.graphics.moveTo(x + (Math.cos(start) * outerRadius), y - (Math.sin(start) * outerRadius));
				
				// draw lines
				for (n = 1;n <= count;n++) 
				{
					dx = x + Math.cos(start + (step * n) - halfStep) * innerRadius;
					dy = y - Math.sin(start + (step * n) - halfStep) * innerRadius;
					s.graphics.lineTo(dx, dy);
					
					dx = x + Math.cos(start + (step * n)) * outerRadius;
					dy = y - Math.sin(start + (step * n)) * outerRadius;
					s.graphics.lineTo(dx, dy);
				}
			}
		}
		
		
		/*
		 * 
		 * DRAW A TRIANGLES
		 * 
		 */
		public static function drawTriangle(s:Sprite, x:Number, y:Number, width:Number, height:Number):void
		{
			s.graphics.moveTo(x - width / 2, y - height / 2);
			s.graphics.lineTo(x + width / 2, y);
			s.graphics.lineTo(x - width / 2, y + height / 2);
			s.graphics.lineTo(x - width / 2, y - height / 2);
		}
		public static function drawRoundTriangle(s:Sprite, x:Number, y:Number, width:Number, height:Number, radius:Number):void
		{
			s.graphics.moveTo(x + width / 2 + radius, y + radius);
			s.graphics.lineTo(x + width - radius, y + height - radius);
			s.graphics.curveTo(x + width, y + height + radius, x + width - 2 * radius, y + height + radius);
			s.graphics.lineTo(x + 2 * radius, y + height + radius);
			s.graphics.curveTo(x, y + height + radius, x + radius, y + height - radius);
			s.graphics.lineTo(x + width / 2 - radius, y + radius);
			s.graphics.curveTo(x + width / 2, y - radius, x + width / 2 + radius, y + radius);
		}
	}
}