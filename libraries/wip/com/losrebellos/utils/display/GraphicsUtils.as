package com.losrebellos.utils.display 
{
	import flash.display.Graphics;
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
	public final class GraphicsUtils 
	{
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// TODO: refactor it all
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// WEDGE
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//circle
		public static function drawWedgeCircle(s:Sprite, x:Number, y:Number, startAngle:Number, arc:Number, radius:Number, close:Boolean = true):Boolean
		{
			return drawWedgeEllipse(s, x, y, startAngle, arc, radius, radius, close);
		}
		//ellipse
		public static function drawWedgeEllipse(s:Sprite, x:Number, y:Number, startAngle:Number, arc:Number, xRadius:Number, yRadius:Number, close:Boolean = true):Boolean
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
				var g:Graphics = s.graphics;
				
				// draw a line from the center to the start of the curve
				ax = x + Math.cos(startAngle / 180 * Math.PI) * xRadius;
				ay = y + Math.sin(-startAngle / 180 * Math.PI) * yRadius;
				if(!close)
				{
					g.moveTo(ax, ay);
				}
				else
				{
					g.lineTo(ax, ay);
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
					g.curveTo(cx, cy, bx, by);
				}
				
				// close the wedge by drawing a line to the center
				if(close)
				{
					g.lineTo(x, y);
				}
				
				return true;
			}
			
			return false;
		}

		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// STAR
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function drawStar(s:Sprite, x:Number, y:Number, points:int, innerRadius:Number, outerRadius:Number, angle:Number):Boolean
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
				
				//draw
				var g:Graphics = s.graphics;
				g.moveTo(x + (Math.cos(start) * outerRadius), y - (Math.sin(start) * outerRadius));
				
				// draw lines
				for (n = 1;n <= count;n++) 
				{
					dx = x + Math.cos(start + (step * n) - halfStep) * innerRadius;
					dy = y - Math.sin(start + (step * n) - halfStep) * innerRadius;
					g.lineTo(dx, dy);
					
					dx = x + Math.cos(start + (step * n)) * outerRadius;
					dy = y - Math.sin(start + (step * n)) * outerRadius;
					g.lineTo(dx, dy);
				}
				
				return true;
			}
			
			return false;
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// TRIANGLES
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		public static function drawTriangle(s:Sprite, x:Number, y:Number, width:Number, height:Number):void
		{
			var g:Graphics = s.graphics;
			g.moveTo(x - width / 2, y - height / 2);
			g.lineTo(x + width / 2, y);
			g.lineTo(x - width / 2, y + height / 2);
			g.lineTo(x - width / 2, y - height / 2);
		}
		public static function drawRoundTriangle(s:Sprite, x:Number, y:Number, width:Number, height:Number, radius:Number):void
		{
			var g:Graphics = s.graphics;
			g.moveTo(x + width / 2 + radius, y + radius);
			g.lineTo(x + width - radius, y + height - radius);
			g.curveTo(x + width, y + height + radius, x + width - 2 * radius, y + height + radius);
			g.lineTo(x + 2 * radius, y + height + radius);
			g.curveTo(x, y + height + radius, x + radius, y + height - radius);
			g.lineTo(x + width / 2 - radius, y + radius);
			g.curveTo(x + width / 2, y - radius, x + width / 2 + radius, y + radius);
		}
		
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// AFTER THIS POINT: ALL UNTESTED
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * 
		 * POLYGON
		 * 
		 */
		/*-------------------------------------------------------------
			mc.drawPoly is a method for creating regular
			polygons. Negative values for sides will draw the
			polygon in the reverse direction, which allows for
			creating knock-outs in masks.
		-------------------------------------------------------------*/
		public static function drawPoly(s:Sprite, x:Number, y:Number, sides:int, radius:Number, angle:Number = 0):Boolean
		{
			// ==============
			// mc.drawPoly() - by Ric Ewing (ric@formequalsfunction.com) - version 1.4 - 4.7.2002
			// 
			// x, y = center of polygon
			// sides = number of sides (Math.abs(sides) must be > 2)
			// radius = radius of the points of the polygon from the center
			// angle = [optional] starting angle in degrees. (defaults to 0)
			// ==============
			
			// check that sides is sufficient to build polygon
			if(sides > 2)
			{
				// calculate span of sides
				var step:Number = (Math.PI * 2) / sides;
				
				// calculate starting angle in radians
				var start:Number = (angle / 180) * Math.PI;
				
				// draw
				var g:Graphics = s.graphics;
				g.moveTo(x + (Math.cos(start) * radius), y - (Math.sin(start) * radius));
				
				// draw the polygon
				var dx:Number;
				var dy:Number;
				for(var n:int = 1; n <= sides; n++)
				{
					dx = x + Math.cos(start + (step * n)) * radius;
					dy = y - Math.sin(start + (step * n)) * radius;
					g.lineTo(dx, dy);
				}
				
				return true;
			}
			
			return false;
		}
		
		
		/*-------------------------------------------------------------
			mc.drawGear is a method that draws gears... you
			know, cogs with teeth and a hole in the middle where
			the axle goes? Okay, okay... so nobody *needs* a
			method to draw a gear. I know that this is probably
			one of my least useful methods. But it was an easy
			adaptation of the polygon method so I did it anyway.
			Enjoy. FYI: if you modify this to draw the hole
			polygon in the opposite direction, it will remain
			transparent if the gear is used for a mask.
		-------------------------------------------------------------*/
		public static function drawGear(s:Sprite, x:Number, y:Number, sides:int, innerRadius:Number, outerRadius:Number, angle:Number, holeSides:int, holeRadius:Number):Boolean
		{
			// ==============
			// mc.drawGear() - by Ric Ewing (ric@formequalsfunction.com) - version 1.3 - 3.5.2002
			// 
			// x, y = center of gear.
			// sides = number of teeth on gear. (must be > 2)
			// innerRadius = radius of the indent of the teeth.
			// outerRadius = outer radius of the teeth.
			// angle = [optional] starting angle in degrees. Defaults to 0.
			// holeSides = [optional] draw a polygonal hole with this many sides (must be > 2)
			// holeRadius = [optional] size of hole. Default = innerRadius/3.
			// ==============
			if(sides > 2)
			{
				// calculate length of sides
				var step:Number = (Math.PI * 2) / sides;
				var qtrStep:Number = step / 4;
				
				// calculate starting angle in radians
				var start:Number = (angle / 180) * Math.PI;
				
				//draw
				var g:Graphics = s.graphics;
				g.moveTo(x + (Math.cos(start) * outerRadius), y - (Math.sin(start) * outerRadius));
				
				// draw lines
				var dx:Number;
				var dy:Number;
				for(var i:int = 1; i <= sides; i++)
				{
					dx = x + Math.cos(start + (step * i) - (qtrStep * 3)) * innerRadius;
					dy = y - Math.sin(start + (step * i) - (qtrStep * 3)) * innerRadius;
					g.lineTo(dx, dy);
					dx = x + Math.cos(start + (step * i) - (qtrStep * 2)) * innerRadius;
					dy = y - Math.sin(start + (step * i) - (qtrStep * 2)) * innerRadius;
					g.lineTo(dx, dy);
					dx = x + Math.cos(start + (step * i) - qtrStep) * outerRadius;
					dy = y - Math.sin(start + (step * i) - qtrStep) * outerRadius;
					g.lineTo(dx, dy);
					dx = x + Math.cos(start + (step * i)) * outerRadius;
					dy = y - Math.sin(start + (step * i)) * outerRadius;
					g.lineTo(dx, dy);
				}
				
				// This is complete overkill... but I had it done already. :)
				if(holeSides > 2)
				{
					if(isNaN(holeRadius))
					{
						holeRadius = innerRadius / 3;
					}
					
					step = (Math.PI * 2) / holeSides;
					g.moveTo(x + (Math.cos(start) * holeRadius), y - (Math.sin(start) * holeRadius));
					
					for(var j:int = 1; j <= holeSides; j++)
					{
						dx = x+Math.cos(start + (step * j)) * holeRadius;
						dy = y - Math.sin(start + (step * j)) * holeRadius;
						g.lineTo(dx, dy);
					}
				}
				
				return true;
			}
			
			return false;
		}
		
		
		/*-------------------------------------------------------------
			mc.drawBurst is a method for drawing bursts (rounded
			star shaped ovals often seen in advertising). This
			seemingly whimsical method actually had a serious
			purpose. It was done to accommodate a client that
			wanted to have custom bursts for 'NEW!' and
			'IMPROVED!' type elements on their site...
			personally I think those look tacky, but it's hard
			to argue with a paying client. :) This method also
			makes some fun flower shapes if you play with the
			input numbers. 
		-------------------------------------------------------------*/
		public static function drawBurst(s:Sprite, x:Number, y:Number, sides:int, innerRadius:Number, outerRadius:Number, angle:Number = 0):Boolean
		{
			// ==============
			// mc.drawBurst() - by Ric Ewing (ric@formequalsfunction.com) - version 1.4 - 4.7.2002
			// 
			// x, y = center of burst
			// sides = number of sides or points
			// innerRadius = radius of the indent of the curves
			// outerRadius = radius of the outermost points
			// angle = [optional] starting angle in degrees. (defaults to 0)
			// ==============
			if (sides > 2) 
			{
				// calculate length of sides
				var step:Number = (Math.PI * 2) / sides;
				var halfStep:Number = step / 2;
				var qtrStep:Number = step / 4;
				// calculate starting angle in radians
				var start:Number = (angle / 180) * Math.PI;
				
				//draw
				var g:Graphics = s.graphics;
				g.moveTo(x + (Math.cos(start) * outerRadius), y - (Math.sin(start) * outerRadius));
				
				// draw curves
				var dx:Number;
				var dy:Number;
				var cx:Number;
				var cy:Number;
				for (var n:int = 1; n <= sides; n++) 
				{
					cx = x + Math.cos(start + (step * n) - (qtrStep * 3)) * (innerRadius / Math.cos(qtrStep));
					cy = y - Math.sin(start + (step * n) - (qtrStep * 3)) * (innerRadius / Math.cos(qtrStep));
					dx = x + Math.cos(start + (step * n) - halfStep) * innerRadius;
					dy = y - Math.sin(start + (step * n) - halfStep) * innerRadius;
					g.curveTo(cx, cy, dx, dy);
					
					cx = x + Math.cos(start + (step * n) - qtrStep) * (innerRadius / Math.cos(qtrStep));
					cy = y - Math.sin(start + (step * n) - qtrStep) * (innerRadius / Math.cos(qtrStep));
					dx = x + Math.cos(start + (step * n)) * outerRadius;
					dy = y - Math.sin(start + (step * n)) * outerRadius;
					g.curveTo(cx, cy, dx, dy);
				}
				
				return true;
			}
			
			return false;
		}
		
		
		/*-------------------------------------------------------------
			mc.dashTo is a metod for drawing dashed (and dotted) 
			lines. I made this to extend the lineTo function because it
			doesnŐt have the cutom line types that the in program
			line tool has. To make a dotted line, specify a dash length
			between .5 and 1.
		-------------------------------------------------------------*/
		public static function dashTo(s:Sprite, startx:Number, starty:Number, endx:Number, endy:Number, len:Number, gap:Number):Boolean
		{
			// ==============
			// mc.dashTo() - by Ric Ewing (ric@formequalsfunction.com) - version 1.2 - 5.3.2002
			// 
			// startx, starty = beginning of dashed line
			// endx, endy = end of dashed line
			// len = length of dash
			// gap = length of gap between dashes
			// ==============
			
			// calculate the legnth of a segment
			var seglength:Number = len + gap;
			
			// calculate the length of the dashed line
			var deltax:Number = endx - startx;
			var deltay:Number = endy - starty;
			var delta:Number = Math.sqrt((deltax * deltax) + (deltay * deltay));
			
			// calculate the number of segments needed
			var segs:Number = Math.floor(Math.abs(delta / seglength));
			
			// get the angle of the line in radians
			var radians:Number = Math.atan2(deltay, deltax);
			
			// add these to cx, cy to get next seg start
			deltax = Math.cos(radians) * seglength;
			deltay = Math.sin(radians) * seglength;
			
			// draw
			var g:Graphics = s.graphics;
			
			// loop through each seg
			var cx:Number = startx;
			var cy:Number = starty;
			for(var n:int = 0; n < segs; n++) 
			{
				g.moveTo(cx, cy);
				g.lineTo(cx + Math.cos(radians) * len, cy + Math.sin(radians) * len);
				cx += deltax;
				cy += deltay;
			}
			
			// handle last segment as it is likely to be partial
			g.moveTo(cx, cy);
			delta = Math.sqrt((endx - cx) * (endx - cx) + (endy - cy) * (endy - cy));
			if(delta > len)
			{
				// segment ends in the gap, so draw a full dash
				g.lineTo(cx + Math.cos(radians) * len, cy + Math.sin(radians) * len);
			}
			else if(delta > 0) 
			{
				// segment is shorter than dash so only draw what is needed
				g.lineTo(cx + Math.cos(radians) * delta, cy + Math.sin(radians) * delta);
			}
			
			// move the pen to the end position
			g.moveTo(endx, endy);
			
			return true;
		}
	}
}