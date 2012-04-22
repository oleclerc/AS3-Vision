package Detector
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	import General.Feature;
	import General.Param;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Fast9Detector 
	{
		private static var FAST9_BORDER:Param = new Param("FAST9_Border", 5);
		private static var FAST9_NONMAX:Param = new Param("FAST9_Nonmax", 1);
		
		public function Fast9Detector() 
		{
			
		}
		
		public static function Detect(im:BitmapData, threshold:int):Vector.<Feature>
		{
			var num_corners:int = 0;
			var ret_corners:Vector.<Feature>;
			var x:int, y:int;
			var len:int;
			ret_corners = new Vector.<Feature>();
			
			//Create 2D vector for image pixels, 
			var image:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(im.height);
			
			//Process all pixels, keeping only the blue channel (will work with greyscale images)
			var pixels:Vector.<uint> = im.getVector(im.rect);
			pixels.fixed = true;
			len = pixels.length;
			for (x = 0; x < len; x++)
			{
				pixels[x] = pixels[x] & 0x0000ff;
			}
			
			//Make 2D vector from 1D vector
			len = im.height;
			for (y = 0; y < len; y++)
			{
				image[y] = pixels.slice(y * im.width, (y + 1) * im.width);
				image[y].fixed = true;
			}
			
			var xsize:int = im.width - FAST9_BORDER.value;
			var ysize:int = im.height - FAST9_BORDER.value;
			for(y = FAST9_BORDER.value; y < ysize; y++)
				for(x = FAST9_BORDER.value; x < xsize; x++)
				{
					
				var cb:int = image[y][x] + threshold;
				var c_b:int = image[y][x] - threshold;
				if (image[y+3][x+0] > cb) 
				 if (image[y+3][x+1] > cb) 
				  if (image[y+2][x+2] > cb) 
				   if (image[y+1][x+3] > cb) 
					if (image[y+0][x+3] > cb) 
					 if (image[y+-1][x+3] > cb) 
					  if (image[y+-2][x+2] > cb) 
					   if (image[y+-3][x+1] > cb) 
						if (image[y+-3][x+0] > cb) 
						 {}
						else
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  continue;
					   else if (image[y+-3][x+1] < c_b) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  continue;
						else if (image[y+2][x+-2] < c_b) 
						 if (image[y+-3][x+0] < c_b)
						  if (image[y+-3][x+-1] < c_b)
						   if (image[y+-2][x+-2] < c_b)
							if (image[y+-1][x+-3] < c_b)
							 if (image[y+0][x+-3] < c_b)
							  if (image[y+1][x+-3] < c_b)
							   if (image[y+3][x+-1] < c_b)
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  continue;
						else
						 continue;
					  else if (image[y+-2][x+2] < c_b) 
					   if (image[y+3][x+-1] > cb) 
						if (image[y+1][x+-3] > cb) 
						 if (image[y+2][x+-2] > cb) 
						  {}
						 else
						  continue;
						else if (image[y+1][x+-3] < c_b) 
						 if (image[y+-3][x+1] < c_b)
						  if (image[y+-3][x+0] < c_b)
						   if (image[y+-3][x+-1] < c_b)
							if (image[y+-2][x+-2] < c_b)
							 if (image[y+-1][x+-3] < c_b)
							  if (image[y+0][x+-3] < c_b)
							   if (image[y+2][x+-2] < c_b)
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						if (image[y+-3][x+1] < c_b)
						 if (image[y+-3][x+0] < c_b)
						  if (image[y+-3][x+-1] < c_b)
						   if (image[y+-2][x+-2] < c_b)
							if (image[y+-1][x+-3] < c_b)
							 if (image[y+0][x+-3] < c_b)
							  if (image[y+1][x+-3] < c_b)
							   if (image[y+2][x+-2] < c_b)
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  continue;
						else
						 continue;
					   else if (image[y+1][x+-3] < c_b) 
						if (image[y+-3][x+1] < c_b)
						 if (image[y+-3][x+0] < c_b)
						  if (image[y+-3][x+-1] < c_b)
						   if (image[y+-2][x+-2] < c_b)
							if (image[y+-1][x+-3] < c_b)
							 if (image[y+0][x+-3] < c_b)
							  if (image[y+2][x+-2] < c_b)
							   if (image[y+3][x+-1] < c_b)
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else if (image[y+-1][x+3] < c_b) 
					  if (image[y+2][x+-2] > cb) 
					   if (image[y+0][x+-3] > cb) 
						if (image[y+1][x+-3] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  if (image[y+-2][x+-2] > cb) 
							   if (image[y+-1][x+-3] > cb) 
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 continue;
					   else if (image[y+0][x+-3] < c_b) 
						if (image[y+-2][x+2] < c_b)
						 if (image[y+-3][x+1] < c_b)
						  if (image[y+-3][x+0] < c_b)
						   if (image[y+-3][x+-1] < c_b)
							if (image[y+-2][x+-2] < c_b)
							 if (image[y+-1][x+-3] < c_b)
							  if (image[y+1][x+-3] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else if (image[y+2][x+-2] < c_b) 
					   if (image[y+-3][x+1] < c_b)
						if (image[y+-3][x+0] < c_b)
						 if (image[y+-3][x+-1] < c_b)
						  if (image[y+-2][x+-2] < c_b)
						   if (image[y+-1][x+-3] < c_b)
							if (image[y+0][x+-3] < c_b)
							 if (image[y+1][x+-3] < c_b)
							  if (image[y+-2][x+2] < c_b)
							   {}
							  else
							   if (image[y+3][x+-1] < c_b)
								{}
							   else
								continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   if (image[y+-2][x+2] < c_b)
						if (image[y+-3][x+1] < c_b)
						 if (image[y+-3][x+0] < c_b)
						  if (image[y+-3][x+-1] < c_b)
						   if (image[y+-2][x+-2] < c_b)
							if (image[y+-1][x+-3] < c_b)
							 if (image[y+0][x+-3] < c_b)
							  if (image[y+1][x+-3] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  if (image[y+-2][x+-2] > cb) 
							   if (image[y+-1][x+-3] > cb) 
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 continue;
					   else
						continue;
					  else if (image[y+0][x+-3] < c_b) 
					   if (image[y+-3][x+1] < c_b)
						if (image[y+-3][x+0] < c_b)
						 if (image[y+-3][x+-1] < c_b)
						  if (image[y+-2][x+-2] < c_b)
						   if (image[y+-1][x+-3] < c_b)
							if (image[y+1][x+-3] < c_b)
							 if (image[y+2][x+-2] < c_b)
							  if (image[y+-2][x+2] < c_b)
							   {}
							  else
							   if (image[y+3][x+-1] < c_b)
								{}
							   else
								continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else if (image[y+0][x+3] < c_b) 
					 if (image[y+1][x+-3] > cb) 
					  if (image[y+-1][x+-3] > cb) 
					   if (image[y+0][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  if (image[y+-2][x+-2] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  if (image[y+-2][x+-2] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						continue;
					  else if (image[y+-1][x+-3] < c_b) 
					   if (image[y+-1][x+3] < c_b)
						if (image[y+-2][x+2] < c_b)
						 if (image[y+-3][x+1] < c_b)
						  if (image[y+-3][x+0] < c_b)
						   if (image[y+-3][x+-1] < c_b)
							if (image[y+-2][x+-2] < c_b)
							 if (image[y+0][x+-3] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else if (image[y+1][x+-3] < c_b) 
					  if (image[y+-3][x+1] < c_b)
					   if (image[y+-3][x+0] < c_b)
						if (image[y+-3][x+-1] < c_b)
						 if (image[y+-2][x+-2] < c_b)
						  if (image[y+-1][x+-3] < c_b)
						   if (image[y+0][x+-3] < c_b)
							if (image[y+-2][x+2] < c_b)
							 if (image[y+-1][x+3] < c_b)
							  {}
							 else
							  if (image[y+2][x+-2] < c_b)
							   {}
							  else
							   continue;
							else
							 if (image[y+2][x+-2] < c_b)
							  if (image[y+3][x+-1] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  if (image[y+-1][x+3] < c_b)
					   if (image[y+-2][x+2] < c_b)
						if (image[y+-3][x+1] < c_b)
						 if (image[y+-3][x+0] < c_b)
						  if (image[y+-3][x+-1] < c_b)
						   if (image[y+-2][x+-2] < c_b)
							if (image[y+-1][x+-3] < c_b)
							 if (image[y+0][x+-3] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  if (image[y+-2][x+-2] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  if (image[y+-2][x+-2] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						continue;
					  else
					   continue;
					 else if (image[y+-1][x+-3] < c_b) 
					  if (image[y+-3][x+1] < c_b)
					   if (image[y+-3][x+0] < c_b)
						if (image[y+-3][x+-1] < c_b)
						 if (image[y+-2][x+-2] < c_b)
						  if (image[y+0][x+-3] < c_b)
						   if (image[y+1][x+-3] < c_b)
							if (image[y+-2][x+2] < c_b)
							 if (image[y+-1][x+3] < c_b)
							  {}
							 else
							  if (image[y+2][x+-2] < c_b)
							   {}
							  else
							   continue;
							else
							 if (image[y+2][x+-2] < c_b)
							  if (image[y+3][x+-1] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
				   else if (image[y+1][x+3] < c_b) 
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   continue;
					 else
					  continue;
					else if (image[y+-2][x+-2] < c_b) 
					 if (image[y+-3][x+1] < c_b)
					  if (image[y+-3][x+0] < c_b)
					   if (image[y+-3][x+-1] < c_b)
						if (image[y+-1][x+-3] < c_b)
						 if (image[y+-2][x+2] < c_b)
						  if (image[y+-1][x+3] < c_b)
						   if (image[y+0][x+3] < c_b)
							{}
						   else
							if (image[y+0][x+-3] < c_b)
							 if (image[y+1][x+-3] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						  else
						   if (image[y+0][x+-3] < c_b)
							if (image[y+1][x+-3] < c_b)
							 if (image[y+2][x+-2] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						 else
						  if (image[y+0][x+-3] < c_b)
						   if (image[y+1][x+-3] < c_b)
							if (image[y+2][x+-2] < c_b)
							 if (image[y+3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				   else
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 if (image[y+-3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   continue;
					 else
					  continue;
					else if (image[y+-2][x+-2] < c_b) 
					 if (image[y+-3][x+1] < c_b)
					  if (image[y+-3][x+0] < c_b)
					   if (image[y+-3][x+-1] < c_b)
						if (image[y+-1][x+-3] < c_b)
						 if (image[y+0][x+-3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-1][x+3] < c_b)
							if (image[y+0][x+3] < c_b)
							 {}
							else
							 if (image[y+1][x+-3] < c_b)
							  {}
							 else
							  continue;
						   else
							if (image[y+1][x+-3] < c_b)
							 if (image[y+2][x+-2] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						  else
						   if (image[y+1][x+-3] < c_b)
							if (image[y+2][x+-2] < c_b)
							 if (image[y+3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				  else if (image[y+2][x+2] < c_b) 
				   if (image[y+-3][x+-1] > cb) 
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] > cb) 
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  continue;
					else
					 continue;
				   else if (image[y+-3][x+-1] < c_b) 
					if (image[y+-3][x+1] < c_b)
					 if (image[y+-3][x+0] < c_b)
					  if (image[y+-2][x+-2] < c_b)
					   if (image[y+-2][x+2] < c_b)
						if (image[y+-1][x+3] < c_b)
						 if (image[y+0][x+3] < c_b)
						  if (image[y+1][x+3] < c_b)
						   {}
						  else
						   if (image[y+-1][x+-3] < c_b)
							if (image[y+0][x+-3] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						 else
						  if (image[y+-1][x+-3] < c_b)
						   if (image[y+0][x+-3] < c_b)
							if (image[y+1][x+-3] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+-3] < c_b)
						  if (image[y+0][x+-3] < c_b)
						   if (image[y+1][x+-3] < c_b)
							if (image[y+2][x+-2] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-1][x+-3] < c_b)
						 if (image[y+0][x+-3] < c_b)
						  if (image[y+1][x+-3] < c_b)
						   if (image[y+2][x+-2] < c_b)
							if (image[y+3][x+-1] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				   else
					continue;
				  else
				   if (image[y+-3][x+-1] > cb) 
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] > cb) 
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							if (image[y+-3][x+0] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  continue;
					else
					 continue;
				   else if (image[y+-3][x+-1] < c_b) 
					if (image[y+-3][x+1] < c_b)
					 if (image[y+-3][x+0] < c_b)
					  if (image[y+-2][x+-2] < c_b)
					   if (image[y+-1][x+-3] < c_b)
						if (image[y+-2][x+2] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+0][x+3] < c_b)
						   if (image[y+1][x+3] < c_b)
							{}
						   else
							if (image[y+0][x+-3] < c_b)
							 {}
							else
							 continue;
						  else
						   if (image[y+0][x+-3] < c_b)
							if (image[y+1][x+-3] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						 else
						  if (image[y+0][x+-3] < c_b)
						   if (image[y+1][x+-3] < c_b)
							if (image[y+2][x+-2] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+0][x+-3] < c_b)
						  if (image[y+1][x+-3] < c_b)
						   if (image[y+2][x+-2] < c_b)
							if (image[y+3][x+-1] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				   else
					continue;
				 else if (image[y+3][x+1] < c_b) 
				  if (image[y+-3][x+0] > cb) 
				   if (image[y+-3][x+-1] > cb) 
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] > cb) 
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+2][x+2] > cb) 
					   if (image[y+1][x+3] > cb) 
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 continue;
				   else
					continue;
				  else if (image[y+-3][x+0] < c_b) 
				   if (image[y+-3][x+1] < c_b)
					if (image[y+-3][x+-1] < c_b)
					 if (image[y+-2][x+2] < c_b)
					  if (image[y+-1][x+3] < c_b)
					   if (image[y+0][x+3] < c_b)
						if (image[y+1][x+3] < c_b)
						 if (image[y+2][x+2] < c_b)
						  {}
						 else
						  if (image[y+-2][x+-2] < c_b)
						   if (image[y+-1][x+-3] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-2][x+-2] < c_b)
						  if (image[y+-1][x+-3] < c_b)
						   if (image[y+0][x+-3] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-2][x+-2] < c_b)
						 if (image[y+-1][x+-3] < c_b)
						  if (image[y+0][x+-3] < c_b)
						   if (image[y+1][x+-3] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+-2][x+-2] < c_b)
						if (image[y+-1][x+-3] < c_b)
						 if (image[y+0][x+-3] < c_b)
						  if (image[y+1][x+-3] < c_b)
						   if (image[y+2][x+-2] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+-2][x+-2] < c_b)
					   if (image[y+-1][x+-3] < c_b)
						if (image[y+0][x+-3] < c_b)
						 if (image[y+1][x+-3] < c_b)
						  if (image[y+2][x+-2] < c_b)
						   if (image[y+3][x+-1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 continue;
				   else
					continue;
				  else
				   continue;
				 else
				  if (image[y+-3][x+0] > cb) 
				   if (image[y+-3][x+-1] > cb) 
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+1][x+-3] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+3][x+-1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] > cb) 
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+2][x+2] > cb) 
					   if (image[y+1][x+3] > cb) 
						if (image[y+0][x+3] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-3][x+1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 continue;
				   else
					continue;
				  else if (image[y+-3][x+0] < c_b) 
				   if (image[y+-3][x+1] < c_b)
					if (image[y+-3][x+-1] < c_b)
					 if (image[y+-2][x+-2] < c_b)
					  if (image[y+-2][x+2] < c_b)
					   if (image[y+-1][x+3] < c_b)
						if (image[y+0][x+3] < c_b)
						 if (image[y+1][x+3] < c_b)
						  if (image[y+2][x+2] < c_b)
						   {}
						  else
						   if (image[y+-1][x+-3] < c_b)
							{}
						   else
							continue;
						 else
						  if (image[y+-1][x+-3] < c_b)
						   if (image[y+0][x+-3] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+-3] < c_b)
						  if (image[y+0][x+-3] < c_b)
						   if (image[y+1][x+-3] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-1][x+-3] < c_b)
						 if (image[y+0][x+-3] < c_b)
						  if (image[y+1][x+-3] < c_b)
						   if (image[y+2][x+-2] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+-1][x+-3] < c_b)
						if (image[y+0][x+-3] < c_b)
						 if (image[y+1][x+-3] < c_b)
						  if (image[y+2][x+-2] < c_b)
						   if (image[y+3][x+-1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  continue;
					else
					 continue;
				   else
					continue;
				  else
				   continue;
				else if (image[y+3][x+0] < c_b) 
				 if (image[y+3][x+1] > cb) 
				  if (image[y+-3][x+0] > cb) 
				   if (image[y+-3][x+1] > cb) 
					if (image[y+-3][x+-1] > cb) 
					 if (image[y+-2][x+2] > cb) 
					  if (image[y+-1][x+3] > cb) 
					   if (image[y+0][x+3] > cb) 
						if (image[y+1][x+3] > cb) 
						 if (image[y+2][x+2] > cb) 
						  {}
						 else
						  if (image[y+-2][x+-2] > cb) 
						   if (image[y+-1][x+-3] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-2][x+-2] > cb) 
						  if (image[y+-1][x+-3] > cb) 
						   if (image[y+0][x+-3] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-2][x+-2] > cb) 
						 if (image[y+-1][x+-3] > cb) 
						  if (image[y+0][x+-3] > cb) 
						   if (image[y+1][x+-3] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+-2][x+-2] > cb) 
						if (image[y+-1][x+-3] > cb) 
						 if (image[y+0][x+-3] > cb) 
						  if (image[y+1][x+-3] > cb) 
						   if (image[y+2][x+-2] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+-2][x+-2] > cb) 
					   if (image[y+-1][x+-3] > cb) 
						if (image[y+0][x+-3] > cb) 
						 if (image[y+1][x+-3] > cb) 
						  if (image[y+2][x+-2] > cb) 
						   if (image[y+3][x+-1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 continue;
				   else
					continue;
				  else if (image[y+-3][x+0] < c_b) 
				   if (image[y+-3][x+-1] < c_b)
					if (image[y+-2][x+-2] < c_b)
					 if (image[y+-1][x+-3] < c_b)
					  if (image[y+0][x+-3] < c_b)
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] < c_b)
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+2][x+2] < c_b)
					   if (image[y+1][x+3] < c_b)
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 continue;
				   else
					continue;
				  else
				   continue;
				 else if (image[y+3][x+1] < c_b) 
				  if (image[y+2][x+2] > cb) 
				   if (image[y+-3][x+-1] > cb) 
					if (image[y+-3][x+1] > cb) 
					 if (image[y+-3][x+0] > cb) 
					  if (image[y+-2][x+-2] > cb) 
					   if (image[y+-2][x+2] > cb) 
						if (image[y+-1][x+3] > cb) 
						 if (image[y+0][x+3] > cb) 
						  if (image[y+1][x+3] > cb) 
						   {}
						  else
						   if (image[y+-1][x+-3] > cb) 
							if (image[y+0][x+-3] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						 else
						  if (image[y+-1][x+-3] > cb) 
						   if (image[y+0][x+-3] > cb) 
							if (image[y+1][x+-3] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+-3] > cb) 
						  if (image[y+0][x+-3] > cb) 
						   if (image[y+1][x+-3] > cb) 
							if (image[y+2][x+-2] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-1][x+-3] > cb) 
						 if (image[y+0][x+-3] > cb) 
						  if (image[y+1][x+-3] > cb) 
						   if (image[y+2][x+-2] > cb) 
							if (image[y+3][x+-1] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				   else if (image[y+-3][x+-1] < c_b) 
					if (image[y+-2][x+-2] < c_b)
					 if (image[y+-1][x+-3] < c_b)
					  if (image[y+0][x+-3] < c_b)
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] < c_b)
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  continue;
					else
					 continue;
				   else
					continue;
				  else if (image[y+2][x+2] < c_b) 
				   if (image[y+1][x+3] > cb) 
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-3][x+1] > cb) 
					  if (image[y+-3][x+0] > cb) 
					   if (image[y+-3][x+-1] > cb) 
						if (image[y+-1][x+-3] > cb) 
						 if (image[y+-2][x+2] > cb) 
						  if (image[y+-1][x+3] > cb) 
						   if (image[y+0][x+3] > cb) 
							{}
						   else
							if (image[y+0][x+-3] > cb) 
							 if (image[y+1][x+-3] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						  else
						   if (image[y+0][x+-3] > cb) 
							if (image[y+1][x+-3] > cb) 
							 if (image[y+2][x+-2] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						 else
						  if (image[y+0][x+-3] > cb) 
						   if (image[y+1][x+-3] > cb) 
							if (image[y+2][x+-2] > cb) 
							 if (image[y+3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
					else if (image[y+-2][x+-2] < c_b) 
					 if (image[y+-1][x+-3] < c_b)
					  if (image[y+0][x+-3] < c_b)
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				   else if (image[y+1][x+3] < c_b) 
					if (image[y+0][x+3] > cb) 
					 if (image[y+1][x+-3] > cb) 
					  if (image[y+-3][x+1] > cb) 
					   if (image[y+-3][x+0] > cb) 
						if (image[y+-3][x+-1] > cb) 
						 if (image[y+-2][x+-2] > cb) 
						  if (image[y+-1][x+-3] > cb) 
						   if (image[y+0][x+-3] > cb) 
							if (image[y+-2][x+2] > cb) 
							 if (image[y+-1][x+3] > cb) 
							  {}
							 else
							  if (image[y+2][x+-2] > cb) 
							   {}
							  else
							   continue;
							else
							 if (image[y+2][x+-2] > cb) 
							  if (image[y+3][x+-1] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else if (image[y+1][x+-3] < c_b) 
					  if (image[y+-1][x+-3] > cb) 
					   if (image[y+-1][x+3] > cb) 
						if (image[y+-2][x+2] > cb) 
						 if (image[y+-3][x+1] > cb) 
						  if (image[y+-3][x+0] > cb) 
						   if (image[y+-3][x+-1] > cb) 
							if (image[y+-2][x+-2] > cb) 
							 if (image[y+0][x+-3] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else if (image[y+-1][x+-3] < c_b) 
					   if (image[y+0][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  if (image[y+-2][x+-2] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  if (image[y+-2][x+-2] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						continue;
					  else
					   continue;
					 else
					  if (image[y+-1][x+3] > cb) 
					   if (image[y+-2][x+2] > cb) 
						if (image[y+-3][x+1] > cb) 
						 if (image[y+-3][x+0] > cb) 
						  if (image[y+-3][x+-1] > cb) 
						   if (image[y+-2][x+-2] > cb) 
							if (image[y+-1][x+-3] > cb) 
							 if (image[y+0][x+-3] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else if (image[y+0][x+3] < c_b) 
					 if (image[y+-1][x+3] > cb) 
					  if (image[y+2][x+-2] > cb) 
					   if (image[y+-3][x+1] > cb) 
						if (image[y+-3][x+0] > cb) 
						 if (image[y+-3][x+-1] > cb) 
						  if (image[y+-2][x+-2] > cb) 
						   if (image[y+-1][x+-3] > cb) 
							if (image[y+0][x+-3] > cb) 
							 if (image[y+1][x+-3] > cb) 
							  if (image[y+-2][x+2] > cb) 
							   {}
							  else
							   if (image[y+3][x+-1] > cb) 
								{}
							   else
								continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else if (image[y+2][x+-2] < c_b) 
					   if (image[y+0][x+-3] > cb) 
						if (image[y+-2][x+2] > cb) 
						 if (image[y+-3][x+1] > cb) 
						  if (image[y+-3][x+0] > cb) 
						   if (image[y+-3][x+-1] > cb) 
							if (image[y+-2][x+-2] > cb) 
							 if (image[y+-1][x+-3] > cb) 
							  if (image[y+1][x+-3] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else if (image[y+0][x+-3] < c_b) 
						if (image[y+1][x+-3] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  if (image[y+-2][x+-2] < c_b)
							   if (image[y+-1][x+-3] < c_b)
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 continue;
					   else
						continue;
					  else
					   if (image[y+-2][x+2] > cb) 
						if (image[y+-3][x+1] > cb) 
						 if (image[y+-3][x+0] > cb) 
						  if (image[y+-3][x+-1] > cb) 
						   if (image[y+-2][x+-2] > cb) 
							if (image[y+-1][x+-3] > cb) 
							 if (image[y+0][x+-3] > cb) 
							  if (image[y+1][x+-3] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else if (image[y+-1][x+3] < c_b) 
					  if (image[y+-2][x+2] > cb) 
					   if (image[y+3][x+-1] < c_b)
						if (image[y+1][x+-3] > cb) 
						 if (image[y+-3][x+1] > cb) 
						  if (image[y+-3][x+0] > cb) 
						   if (image[y+-3][x+-1] > cb) 
							if (image[y+-2][x+-2] > cb) 
							 if (image[y+-1][x+-3] > cb) 
							  if (image[y+0][x+-3] > cb) 
							   if (image[y+2][x+-2] > cb) 
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else if (image[y+1][x+-3] < c_b) 
						 if (image[y+2][x+-2] < c_b)
						  {}
						 else
						  continue;
						else
						 continue;
					   else
						if (image[y+-3][x+1] > cb) 
						 if (image[y+-3][x+0] > cb) 
						  if (image[y+-3][x+-1] > cb) 
						   if (image[y+-2][x+-2] > cb) 
							if (image[y+-1][x+-3] > cb) 
							 if (image[y+0][x+-3] > cb) 
							  if (image[y+1][x+-3] > cb) 
							   if (image[y+2][x+-2] > cb) 
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else if (image[y+-2][x+2] < c_b) 
					   if (image[y+-3][x+1] > cb) 
						if (image[y+2][x+-2] > cb) 
						 if (image[y+-3][x+0] > cb) 
						  if (image[y+-3][x+-1] > cb) 
						   if (image[y+-2][x+-2] > cb) 
							if (image[y+-1][x+-3] > cb) 
							 if (image[y+0][x+-3] > cb) 
							  if (image[y+1][x+-3] > cb) 
							   if (image[y+3][x+-1] > cb) 
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else if (image[y+2][x+-2] < c_b) 
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  continue;
						else
						 continue;
					   else if (image[y+-3][x+1] < c_b) 
						if (image[y+-3][x+0] < c_b)
						 {}
						else
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  continue;
					   else
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+-3] > cb) 
						if (image[y+-3][x+1] > cb) 
						 if (image[y+-3][x+0] > cb) 
						  if (image[y+-3][x+-1] > cb) 
						   if (image[y+-2][x+-2] > cb) 
							if (image[y+-1][x+-3] > cb) 
							 if (image[y+0][x+-3] > cb) 
							  if (image[y+2][x+-2] > cb) 
							   if (image[y+3][x+-1] > cb) 
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else if (image[y+1][x+-3] < c_b) 
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+0][x+-3] > cb) 
					   if (image[y+-3][x+1] > cb) 
						if (image[y+-3][x+0] > cb) 
						 if (image[y+-3][x+-1] > cb) 
						  if (image[y+-2][x+-2] > cb) 
						   if (image[y+-1][x+-3] > cb) 
							if (image[y+1][x+-3] > cb) 
							 if (image[y+2][x+-2] > cb) 
							  if (image[y+-2][x+2] > cb) 
							   {}
							  else
							   if (image[y+3][x+-1] > cb) 
								{}
							   else
								continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else if (image[y+0][x+-3] < c_b) 
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  if (image[y+-2][x+-2] < c_b)
							   if (image[y+-1][x+-3] < c_b)
								{}
							   else
								continue;
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 if (image[y+-1][x+-3] > cb) 
					  if (image[y+-3][x+1] > cb) 
					   if (image[y+-3][x+0] > cb) 
						if (image[y+-3][x+-1] > cb) 
						 if (image[y+-2][x+-2] > cb) 
						  if (image[y+0][x+-3] > cb) 
						   if (image[y+1][x+-3] > cb) 
							if (image[y+-2][x+2] > cb) 
							 if (image[y+-1][x+3] > cb) 
							  {}
							 else
							  if (image[y+2][x+-2] > cb) 
							   {}
							  else
							   continue;
							else
							 if (image[y+2][x+-2] > cb) 
							  if (image[y+3][x+-1] > cb) 
							   {}
							  else
							   continue;
							 else
							  continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else if (image[y+-1][x+-3] < c_b) 
					  if (image[y+0][x+-3] < c_b)
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  if (image[y+-2][x+-2] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  if (image[y+-2][x+-2] < c_b)
							   {}
							  else
							   continue;
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
				   else
					if (image[y+-2][x+-2] > cb) 
					 if (image[y+-3][x+1] > cb) 
					  if (image[y+-3][x+0] > cb) 
					   if (image[y+-3][x+-1] > cb) 
						if (image[y+-1][x+-3] > cb) 
						 if (image[y+0][x+-3] > cb) 
						  if (image[y+-2][x+2] > cb) 
						   if (image[y+-1][x+3] > cb) 
							if (image[y+0][x+3] > cb) 
							 {}
							else
							 if (image[y+1][x+-3] > cb) 
							  {}
							 else
							  continue;
						   else
							if (image[y+1][x+-3] > cb) 
							 if (image[y+2][x+-2] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						  else
						   if (image[y+1][x+-3] > cb) 
							if (image[y+2][x+-2] > cb) 
							 if (image[y+3][x+-1] > cb) 
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
					else if (image[y+-2][x+-2] < c_b) 
					 if (image[y+-1][x+-3] < c_b)
					  if (image[y+0][x+-3] < c_b)
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 if (image[y+-3][x+-1] < c_b)
							  {}
							 else
							  continue;
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				  else
				   if (image[y+-3][x+-1] > cb) 
					if (image[y+-3][x+1] > cb) 
					 if (image[y+-3][x+0] > cb) 
					  if (image[y+-2][x+-2] > cb) 
					   if (image[y+-1][x+-3] > cb) 
						if (image[y+-2][x+2] > cb) 
						 if (image[y+-1][x+3] > cb) 
						  if (image[y+0][x+3] > cb) 
						   if (image[y+1][x+3] > cb) 
							{}
						   else
							if (image[y+0][x+-3] > cb) 
							 {}
							else
							 continue;
						  else
						   if (image[y+0][x+-3] > cb) 
							if (image[y+1][x+-3] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						 else
						  if (image[y+0][x+-3] > cb) 
						   if (image[y+1][x+-3] > cb) 
							if (image[y+2][x+-2] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+0][x+-3] > cb) 
						  if (image[y+1][x+-3] > cb) 
						   if (image[y+2][x+-2] > cb) 
							if (image[y+3][x+-1] > cb) 
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
					else
					 continue;
				   else if (image[y+-3][x+-1] < c_b) 
					if (image[y+-2][x+-2] < c_b)
					 if (image[y+-1][x+-3] < c_b)
					  if (image[y+0][x+-3] < c_b)
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] < c_b)
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							if (image[y+-3][x+0] < c_b)
							 {}
							else
							 continue;
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  continue;
					else
					 continue;
				   else
					continue;
				 else
				  if (image[y+-3][x+0] > cb) 
				   if (image[y+-3][x+1] > cb) 
					if (image[y+-3][x+-1] > cb) 
					 if (image[y+-2][x+-2] > cb) 
					  if (image[y+-2][x+2] > cb) 
					   if (image[y+-1][x+3] > cb) 
						if (image[y+0][x+3] > cb) 
						 if (image[y+1][x+3] > cb) 
						  if (image[y+2][x+2] > cb) 
						   {}
						  else
						   if (image[y+-1][x+-3] > cb) 
							{}
						   else
							continue;
						 else
						  if (image[y+-1][x+-3] > cb) 
						   if (image[y+0][x+-3] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+-3] > cb) 
						  if (image[y+0][x+-3] > cb) 
						   if (image[y+1][x+-3] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-1][x+-3] > cb) 
						 if (image[y+0][x+-3] > cb) 
						  if (image[y+1][x+-3] > cb) 
						   if (image[y+2][x+-2] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+-1][x+-3] > cb) 
						if (image[y+0][x+-3] > cb) 
						 if (image[y+1][x+-3] > cb) 
						  if (image[y+2][x+-2] > cb) 
						   if (image[y+3][x+-1] > cb) 
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  continue;
					else
					 continue;
				   else
					continue;
				  else if (image[y+-3][x+0] < c_b) 
				   if (image[y+-3][x+-1] < c_b)
					if (image[y+-2][x+-2] < c_b)
					 if (image[y+-1][x+-3] < c_b)
					  if (image[y+0][x+-3] < c_b)
					   if (image[y+1][x+-3] < c_b)
						if (image[y+2][x+-2] < c_b)
						 if (image[y+3][x+-1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						else
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+1][x+3] < c_b)
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+2][x+2] < c_b)
					   if (image[y+1][x+3] < c_b)
						if (image[y+0][x+3] < c_b)
						 if (image[y+-1][x+3] < c_b)
						  if (image[y+-2][x+2] < c_b)
						   if (image[y+-3][x+1] < c_b)
							{}
						   else
							continue;
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 continue;
				   else
					continue;
				  else
				   continue;
				else
				 if (image[y+-3][x+1] > cb) 
				  if (image[y+-3][x+0] > cb) 
				   if (image[y+-3][x+-1] > cb) 
					if (image[y+-2][x+2] > cb) 
					 if (image[y+-1][x+3] > cb) 
					  if (image[y+0][x+3] > cb) 
					   if (image[y+1][x+3] > cb) 
						if (image[y+2][x+2] > cb) 
						 if (image[y+3][x+1] > cb) 
						  {}
						 else
						  if (image[y+-2][x+-2] > cb) 
						   {}
						  else
						   continue;
						else
						 if (image[y+-2][x+-2] > cb) 
						  if (image[y+-1][x+-3] > cb) 
						   {}
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-2][x+-2] > cb) 
						 if (image[y+-1][x+-3] > cb) 
						  if (image[y+0][x+-3] > cb) 
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+-2][x+-2] > cb) 
						if (image[y+-1][x+-3] > cb) 
						 if (image[y+0][x+-3] > cb) 
						  if (image[y+1][x+-3] > cb) 
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+-2][x+-2] > cb) 
					   if (image[y+-1][x+-3] > cb) 
						if (image[y+0][x+-3] > cb) 
						 if (image[y+1][x+-3] > cb) 
						  if (image[y+2][x+-2] > cb) 
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 if (image[y+-2][x+-2] > cb) 
					  if (image[y+-1][x+-3] > cb) 
					   if (image[y+0][x+-3] > cb) 
						if (image[y+1][x+-3] > cb) 
						 if (image[y+2][x+-2] > cb) 
						  if (image[y+3][x+-1] > cb) 
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
				   else
					continue;
				  else
				   continue;
				 else if (image[y+-3][x+1] < c_b) 
				  if (image[y+-3][x+0] < c_b)
				   if (image[y+-3][x+-1] < c_b)
					if (image[y+-2][x+2] < c_b)
					 if (image[y+-1][x+3] < c_b)
					  if (image[y+0][x+3] < c_b)
					   if (image[y+1][x+3] < c_b)
						if (image[y+2][x+2] < c_b)
						 if (image[y+3][x+1] < c_b)
						  {}
						 else
						  if (image[y+-2][x+-2] < c_b)
						   {}
						  else
						   continue;
						else
						 if (image[y+-2][x+-2] < c_b)
						  if (image[y+-1][x+-3] < c_b)
						   {}
						  else
						   continue;
						 else
						  continue;
					   else
						if (image[y+-2][x+-2] < c_b)
						 if (image[y+-1][x+-3] < c_b)
						  if (image[y+0][x+-3] < c_b)
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					  else
					   if (image[y+-2][x+-2] < c_b)
						if (image[y+-1][x+-3] < c_b)
						 if (image[y+0][x+-3] < c_b)
						  if (image[y+1][x+-3] < c_b)
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					 else
					  if (image[y+-2][x+-2] < c_b)
					   if (image[y+-1][x+-3] < c_b)
						if (image[y+0][x+-3] < c_b)
						 if (image[y+1][x+-3] < c_b)
						  if (image[y+2][x+-2] < c_b)
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					else
					 if (image[y+-2][x+-2] < c_b)
					  if (image[y+-1][x+-3] < c_b)
					   if (image[y+0][x+-3] < c_b)
						if (image[y+1][x+-3] < c_b)
						 if (image[y+2][x+-2] < c_b)
						  if (image[y+3][x+-1] < c_b)
						   {}
						  else
						   continue;
						 else
						  continue;
						else
						 continue;
					   else
						continue;
					  else
					   continue;
					 else
					  continue;
				   else
					continue;
				  else
				   continue;
				 else
				  continue;
				
				var f:Feature = new Feature();
				f.pos = new Point(x, y);
				ret_corners.push(f);
			}
			
			//Calculate score for all corners
			len = ret_corners.length;
			for (var i:int = 0; i < len; i++)
			{
				ret_corners[i].score = corner_score(image, ret_corners[i].pos.x, ret_corners[i].pos.y);
			}
			
			//Do non-maximum suppression
			if (FAST9_NONMAX.value == 1)
			{
				var sc:Vector.<Vector.<int>> = new Vector.<Vector.<int>>();
				sc.length = image.length;
				sc.fixed = true;
				for (i = 0; i < sc.length; i++)
				{
					sc[i] = new Vector.<int>();
					sc[i].length = image[i].length;
					sc[i].fixed = true;
				}
				
				for (i = 0; i < ret_corners.length; i++)
				{
					sc[ret_corners[i].pos.y][ret_corners[i].pos.x] = ret_corners[i].score;
				}
				
				var nonmaxCorners:Vector.<Feature> = new Vector.<Feature>();
				for (i = 0; i < ret_corners.length; i++)
				{
					var s:int = ret_corners[i].score;
					var px:int = ret_corners[i].pos.x;
					var py:int = ret_corners[i].pos.y;
					
					if (s >= sc[py - 1][px + 1] &&
					   s >= sc[py - 1][px] &&
					   s >= sc[py - 1][px - 1] &&
					   s >= sc[py][px + 1] &&
					   s >= sc[py][px - 1] &&
					   s >= sc[py + 1][px + 1] &&
					   s >= sc[py + 1][px] &&
					   s >= sc[py + 1][px - 1])
					{
						nonmaxCorners.push(ret_corners[i]);
					}
				}
				
				return nonmaxCorners;
			}
			else
			{
				return ret_corners;
			}
		}
		
		public static function is_a_corner(i:Vector.<Vector.<uint>>, posx:int, posy:int, b:int):Boolean
		{
			var cb:int = i[posy][posx] + b;
			var c_b:int = i[posy][posx] - b;
			if (i[posy+3][posx+0] > cb) 
			 if (i[posy+3][posx+1] > cb) 
			  if (i[posy+2][posx+2] > cb) 
			   if (i[posy+1][posx+3] > cb) 
				if (i[posy+0][posx+3] > cb) 
				 if (i[posy+-1][posx+3] > cb) 
				  if (i[posy+-2][posx+2] > cb) 
				   if (i[posy+-3][posx+1] > cb) 
					if (i[posy+-3][posx+0] > cb) 
					 return true;
					else
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  return false;
				   else if (i[posy+-3][posx+1] < c_b) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  return false;
					else if (i[posy+2][posx+-2] < c_b) 
					 if (i[posy+-3][posx+0] < c_b)
					  if (i[posy+-3][posx+-1] < c_b)
					   if (i[posy+-2][posx+-2] < c_b)
						if (i[posy+-1][posx+-3] < c_b)
						 if (i[posy+0][posx+-3] < c_b)
						  if (i[posy+1][posx+-3] < c_b)
						   if (i[posy+3][posx+-1] < c_b)
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  return false;
					else
					 return false;
				  else if (i[posy+-2][posx+2] < c_b) 
				   if (i[posy+3][posx+-1] > cb) 
					if (i[posy+1][posx+-3] > cb) 
					 if (i[posy+2][posx+-2] > cb) 
					  return true;
					 else
					  return false;
					else if (i[posy+1][posx+-3] < c_b) 
					 if (i[posy+-3][posx+1] < c_b)
					  if (i[posy+-3][posx+0] < c_b)
					   if (i[posy+-3][posx+-1] < c_b)
						if (i[posy+-2][posx+-2] < c_b)
						 if (i[posy+-1][posx+-3] < c_b)
						  if (i[posy+0][posx+-3] < c_b)
						   if (i[posy+2][posx+-2] < c_b)
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					if (i[posy+-3][posx+1] < c_b)
					 if (i[posy+-3][posx+0] < c_b)
					  if (i[posy+-3][posx+-1] < c_b)
					   if (i[posy+-2][posx+-2] < c_b)
						if (i[posy+-1][posx+-3] < c_b)
						 if (i[posy+0][posx+-3] < c_b)
						  if (i[posy+1][posx+-3] < c_b)
						   if (i[posy+2][posx+-2] < c_b)
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  return false;
					else
					 return false;
				   else if (i[posy+1][posx+-3] < c_b) 
					if (i[posy+-3][posx+1] < c_b)
					 if (i[posy+-3][posx+0] < c_b)
					  if (i[posy+-3][posx+-1] < c_b)
					   if (i[posy+-2][posx+-2] < c_b)
						if (i[posy+-1][posx+-3] < c_b)
						 if (i[posy+0][posx+-3] < c_b)
						  if (i[posy+2][posx+-2] < c_b)
						   if (i[posy+3][posx+-1] < c_b)
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else if (i[posy+-1][posx+3] < c_b) 
				  if (i[posy+2][posx+-2] > cb) 
				   if (i[posy+0][posx+-3] > cb) 
					if (i[posy+1][posx+-3] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  if (i[posy+-2][posx+-2] > cb) 
						   if (i[posy+-1][posx+-3] > cb) 
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 return false;
				   else if (i[posy+0][posx+-3] < c_b) 
					if (i[posy+-2][posx+2] < c_b)
					 if (i[posy+-3][posx+1] < c_b)
					  if (i[posy+-3][posx+0] < c_b)
					   if (i[posy+-3][posx+-1] < c_b)
						if (i[posy+-2][posx+-2] < c_b)
						 if (i[posy+-1][posx+-3] < c_b)
						  if (i[posy+1][posx+-3] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else if (i[posy+2][posx+-2] < c_b) 
				   if (i[posy+-3][posx+1] < c_b)
					if (i[posy+-3][posx+0] < c_b)
					 if (i[posy+-3][posx+-1] < c_b)
					  if (i[posy+-2][posx+-2] < c_b)
					   if (i[posy+-1][posx+-3] < c_b)
						if (i[posy+0][posx+-3] < c_b)
						 if (i[posy+1][posx+-3] < c_b)
						  if (i[posy+-2][posx+2] < c_b)
						   return true;
						  else
						   if (i[posy+3][posx+-1] < c_b)
							return true;
						   else
							return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   if (i[posy+-2][posx+2] < c_b)
					if (i[posy+-3][posx+1] < c_b)
					 if (i[posy+-3][posx+0] < c_b)
					  if (i[posy+-3][posx+-1] < c_b)
					   if (i[posy+-2][posx+-2] < c_b)
						if (i[posy+-1][posx+-3] < c_b)
						 if (i[posy+0][posx+-3] < c_b)
						  if (i[posy+1][posx+-3] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  if (i[posy+-2][posx+-2] > cb) 
						   if (i[posy+-1][posx+-3] > cb) 
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 return false;
				   else
					return false;
				  else if (i[posy+0][posx+-3] < c_b) 
				   if (i[posy+-3][posx+1] < c_b)
					if (i[posy+-3][posx+0] < c_b)
					 if (i[posy+-3][posx+-1] < c_b)
					  if (i[posy+-2][posx+-2] < c_b)
					   if (i[posy+-1][posx+-3] < c_b)
						if (i[posy+1][posx+-3] < c_b)
						 if (i[posy+2][posx+-2] < c_b)
						  if (i[posy+-2][posx+2] < c_b)
						   return true;
						  else
						   if (i[posy+3][posx+-1] < c_b)
							return true;
						   else
							return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else if (i[posy+0][posx+3] < c_b) 
				 if (i[posy+1][posx+-3] > cb) 
				  if (i[posy+-1][posx+-3] > cb) 
				   if (i[posy+0][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  if (i[posy+-2][posx+-2] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  if (i[posy+-2][posx+-2] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					return false;
				  else if (i[posy+-1][posx+-3] < c_b) 
				   if (i[posy+-1][posx+3] < c_b)
					if (i[posy+-2][posx+2] < c_b)
					 if (i[posy+-3][posx+1] < c_b)
					  if (i[posy+-3][posx+0] < c_b)
					   if (i[posy+-3][posx+-1] < c_b)
						if (i[posy+-2][posx+-2] < c_b)
						 if (i[posy+0][posx+-3] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else if (i[posy+1][posx+-3] < c_b) 
				  if (i[posy+-3][posx+1] < c_b)
				   if (i[posy+-3][posx+0] < c_b)
					if (i[posy+-3][posx+-1] < c_b)
					 if (i[posy+-2][posx+-2] < c_b)
					  if (i[posy+-1][posx+-3] < c_b)
					   if (i[posy+0][posx+-3] < c_b)
						if (i[posy+-2][posx+2] < c_b)
						 if (i[posy+-1][posx+3] < c_b)
						  return true;
						 else
						  if (i[posy+2][posx+-2] < c_b)
						   return true;
						  else
						   return false;
						else
						 if (i[posy+2][posx+-2] < c_b)
						  if (i[posy+3][posx+-1] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  if (i[posy+-1][posx+3] < c_b)
				   if (i[posy+-2][posx+2] < c_b)
					if (i[posy+-3][posx+1] < c_b)
					 if (i[posy+-3][posx+0] < c_b)
					  if (i[posy+-3][posx+-1] < c_b)
					   if (i[posy+-2][posx+-2] < c_b)
						if (i[posy+-1][posx+-3] < c_b)
						 if (i[posy+0][posx+-3] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  if (i[posy+-2][posx+-2] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  if (i[posy+-2][posx+-2] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					return false;
				  else
				   return false;
				 else if (i[posy+-1][posx+-3] < c_b) 
				  if (i[posy+-3][posx+1] < c_b)
				   if (i[posy+-3][posx+0] < c_b)
					if (i[posy+-3][posx+-1] < c_b)
					 if (i[posy+-2][posx+-2] < c_b)
					  if (i[posy+0][posx+-3] < c_b)
					   if (i[posy+1][posx+-3] < c_b)
						if (i[posy+-2][posx+2] < c_b)
						 if (i[posy+-1][posx+3] < c_b)
						  return true;
						 else
						  if (i[posy+2][posx+-2] < c_b)
						   return true;
						  else
						   return false;
						else
						 if (i[posy+2][posx+-2] < c_b)
						  if (i[posy+3][posx+-1] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
			   else if (i[posy+1][posx+3] < c_b) 
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   return false;
				 else
				  return false;
				else if (i[posy+-2][posx+-2] < c_b) 
				 if (i[posy+-3][posx+1] < c_b)
				  if (i[posy+-3][posx+0] < c_b)
				   if (i[posy+-3][posx+-1] < c_b)
					if (i[posy+-1][posx+-3] < c_b)
					 if (i[posy+-2][posx+2] < c_b)
					  if (i[posy+-1][posx+3] < c_b)
					   if (i[posy+0][posx+3] < c_b)
						return true;
					   else
						if (i[posy+0][posx+-3] < c_b)
						 if (i[posy+1][posx+-3] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					  else
					   if (i[posy+0][posx+-3] < c_b)
						if (i[posy+1][posx+-3] < c_b)
						 if (i[posy+2][posx+-2] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					 else
					  if (i[posy+0][posx+-3] < c_b)
					   if (i[posy+1][posx+-3] < c_b)
						if (i[posy+2][posx+-2] < c_b)
						 if (i[posy+3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			   else
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 if (i[posy+-3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   return false;
				 else
				  return false;
				else if (i[posy+-2][posx+-2] < c_b) 
				 if (i[posy+-3][posx+1] < c_b)
				  if (i[posy+-3][posx+0] < c_b)
				   if (i[posy+-3][posx+-1] < c_b)
					if (i[posy+-1][posx+-3] < c_b)
					 if (i[posy+0][posx+-3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-1][posx+3] < c_b)
						if (i[posy+0][posx+3] < c_b)
						 return true;
						else
						 if (i[posy+1][posx+-3] < c_b)
						  return true;
						 else
						  return false;
					   else
						if (i[posy+1][posx+-3] < c_b)
						 if (i[posy+2][posx+-2] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					  else
					   if (i[posy+1][posx+-3] < c_b)
						if (i[posy+2][posx+-2] < c_b)
						 if (i[posy+3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			  else if (i[posy+2][posx+2] < c_b) 
			   if (i[posy+-3][posx+-1] > cb) 
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] > cb) 
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  return false;
				else
				 return false;
			   else if (i[posy+-3][posx+-1] < c_b) 
				if (i[posy+-3][posx+1] < c_b)
				 if (i[posy+-3][posx+0] < c_b)
				  if (i[posy+-2][posx+-2] < c_b)
				   if (i[posy+-2][posx+2] < c_b)
					if (i[posy+-1][posx+3] < c_b)
					 if (i[posy+0][posx+3] < c_b)
					  if (i[posy+1][posx+3] < c_b)
					   return true;
					  else
					   if (i[posy+-1][posx+-3] < c_b)
						if (i[posy+0][posx+-3] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					 else
					  if (i[posy+-1][posx+-3] < c_b)
					   if (i[posy+0][posx+-3] < c_b)
						if (i[posy+1][posx+-3] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+-3] < c_b)
					  if (i[posy+0][posx+-3] < c_b)
					   if (i[posy+1][posx+-3] < c_b)
						if (i[posy+2][posx+-2] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-1][posx+-3] < c_b)
					 if (i[posy+0][posx+-3] < c_b)
					  if (i[posy+1][posx+-3] < c_b)
					   if (i[posy+2][posx+-2] < c_b)
						if (i[posy+3][posx+-1] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			   else
				return false;
			  else
			   if (i[posy+-3][posx+-1] > cb) 
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] > cb) 
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						if (i[posy+-3][posx+0] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  return false;
				else
				 return false;
			   else if (i[posy+-3][posx+-1] < c_b) 
				if (i[posy+-3][posx+1] < c_b)
				 if (i[posy+-3][posx+0] < c_b)
				  if (i[posy+-2][posx+-2] < c_b)
				   if (i[posy+-1][posx+-3] < c_b)
					if (i[posy+-2][posx+2] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+0][posx+3] < c_b)
					   if (i[posy+1][posx+3] < c_b)
						return true;
					   else
						if (i[posy+0][posx+-3] < c_b)
						 return true;
						else
						 return false;
					  else
					   if (i[posy+0][posx+-3] < c_b)
						if (i[posy+1][posx+-3] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					 else
					  if (i[posy+0][posx+-3] < c_b)
					   if (i[posy+1][posx+-3] < c_b)
						if (i[posy+2][posx+-2] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+0][posx+-3] < c_b)
					  if (i[posy+1][posx+-3] < c_b)
					   if (i[posy+2][posx+-2] < c_b)
						if (i[posy+3][posx+-1] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			   else
				return false;
			 else if (i[posy+3][posx+1] < c_b) 
			  if (i[posy+-3][posx+0] > cb) 
			   if (i[posy+-3][posx+-1] > cb) 
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] > cb) 
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+2][posx+2] > cb) 
				   if (i[posy+1][posx+3] > cb) 
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 return false;
			   else
				return false;
			  else if (i[posy+-3][posx+0] < c_b) 
			   if (i[posy+-3][posx+1] < c_b)
				if (i[posy+-3][posx+-1] < c_b)
				 if (i[posy+-2][posx+2] < c_b)
				  if (i[posy+-1][posx+3] < c_b)
				   if (i[posy+0][posx+3] < c_b)
					if (i[posy+1][posx+3] < c_b)
					 if (i[posy+2][posx+2] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+-2] < c_b)
					   if (i[posy+-1][posx+-3] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-2][posx+-2] < c_b)
					  if (i[posy+-1][posx+-3] < c_b)
					   if (i[posy+0][posx+-3] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-2][posx+-2] < c_b)
					 if (i[posy+-1][posx+-3] < c_b)
					  if (i[posy+0][posx+-3] < c_b)
					   if (i[posy+1][posx+-3] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+-2][posx+-2] < c_b)
					if (i[posy+-1][posx+-3] < c_b)
					 if (i[posy+0][posx+-3] < c_b)
					  if (i[posy+1][posx+-3] < c_b)
					   if (i[posy+2][posx+-2] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+-2][posx+-2] < c_b)
				   if (i[posy+-1][posx+-3] < c_b)
					if (i[posy+0][posx+-3] < c_b)
					 if (i[posy+1][posx+-3] < c_b)
					  if (i[posy+2][posx+-2] < c_b)
					   if (i[posy+3][posx+-1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 return false;
			   else
				return false;
			  else
			   return false;
			 else
			  if (i[posy+-3][posx+0] > cb) 
			   if (i[posy+-3][posx+-1] > cb) 
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+3][posx+-1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] > cb) 
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+2][posx+2] > cb) 
				   if (i[posy+1][posx+3] > cb) 
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-3][posx+1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 return false;
			   else
				return false;
			  else if (i[posy+-3][posx+0] < c_b) 
			   if (i[posy+-3][posx+1] < c_b)
				if (i[posy+-3][posx+-1] < c_b)
				 if (i[posy+-2][posx+-2] < c_b)
				  if (i[posy+-2][posx+2] < c_b)
				   if (i[posy+-1][posx+3] < c_b)
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+1][posx+3] < c_b)
					  if (i[posy+2][posx+2] < c_b)
					   return true;
					  else
					   if (i[posy+-1][posx+-3] < c_b)
						return true;
					   else
						return false;
					 else
					  if (i[posy+-1][posx+-3] < c_b)
					   if (i[posy+0][posx+-3] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+-3] < c_b)
					  if (i[posy+0][posx+-3] < c_b)
					   if (i[posy+1][posx+-3] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-1][posx+-3] < c_b)
					 if (i[posy+0][posx+-3] < c_b)
					  if (i[posy+1][posx+-3] < c_b)
					   if (i[posy+2][posx+-2] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+-1][posx+-3] < c_b)
					if (i[posy+0][posx+-3] < c_b)
					 if (i[posy+1][posx+-3] < c_b)
					  if (i[posy+2][posx+-2] < c_b)
					   if (i[posy+3][posx+-1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  return false;
				else
				 return false;
			   else
				return false;
			  else
			   return false;
			else if (i[posy+3][posx+0] < c_b) 
			 if (i[posy+3][posx+1] > cb) 
			  if (i[posy+-3][posx+0] > cb) 
			   if (i[posy+-3][posx+1] > cb) 
				if (i[posy+-3][posx+-1] > cb) 
				 if (i[posy+-2][posx+2] > cb) 
				  if (i[posy+-1][posx+3] > cb) 
				   if (i[posy+0][posx+3] > cb) 
					if (i[posy+1][posx+3] > cb) 
					 if (i[posy+2][posx+2] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+-2] > cb) 
					   if (i[posy+-1][posx+-3] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-2][posx+-2] > cb) 
					  if (i[posy+-1][posx+-3] > cb) 
					   if (i[posy+0][posx+-3] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-2][posx+-2] > cb) 
					 if (i[posy+-1][posx+-3] > cb) 
					  if (i[posy+0][posx+-3] > cb) 
					   if (i[posy+1][posx+-3] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+-2][posx+-2] > cb) 
					if (i[posy+-1][posx+-3] > cb) 
					 if (i[posy+0][posx+-3] > cb) 
					  if (i[posy+1][posx+-3] > cb) 
					   if (i[posy+2][posx+-2] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+-2][posx+-2] > cb) 
				   if (i[posy+-1][posx+-3] > cb) 
					if (i[posy+0][posx+-3] > cb) 
					 if (i[posy+1][posx+-3] > cb) 
					  if (i[posy+2][posx+-2] > cb) 
					   if (i[posy+3][posx+-1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 return false;
			   else
				return false;
			  else if (i[posy+-3][posx+0] < c_b) 
			   if (i[posy+-3][posx+-1] < c_b)
				if (i[posy+-2][posx+-2] < c_b)
				 if (i[posy+-1][posx+-3] < c_b)
				  if (i[posy+0][posx+-3] < c_b)
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] < c_b)
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+2][posx+2] < c_b)
				   if (i[posy+1][posx+3] < c_b)
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 return false;
			   else
				return false;
			  else
			   return false;
			 else if (i[posy+3][posx+1] < c_b) 
			  if (i[posy+2][posx+2] > cb) 
			   if (i[posy+-3][posx+-1] > cb) 
				if (i[posy+-3][posx+1] > cb) 
				 if (i[posy+-3][posx+0] > cb) 
				  if (i[posy+-2][posx+-2] > cb) 
				   if (i[posy+-2][posx+2] > cb) 
					if (i[posy+-1][posx+3] > cb) 
					 if (i[posy+0][posx+3] > cb) 
					  if (i[posy+1][posx+3] > cb) 
					   return true;
					  else
					   if (i[posy+-1][posx+-3] > cb) 
						if (i[posy+0][posx+-3] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					 else
					  if (i[posy+-1][posx+-3] > cb) 
					   if (i[posy+0][posx+-3] > cb) 
						if (i[posy+1][posx+-3] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+-3] > cb) 
					  if (i[posy+0][posx+-3] > cb) 
					   if (i[posy+1][posx+-3] > cb) 
						if (i[posy+2][posx+-2] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-1][posx+-3] > cb) 
					 if (i[posy+0][posx+-3] > cb) 
					  if (i[posy+1][posx+-3] > cb) 
					   if (i[posy+2][posx+-2] > cb) 
						if (i[posy+3][posx+-1] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			   else if (i[posy+-3][posx+-1] < c_b) 
				if (i[posy+-2][posx+-2] < c_b)
				 if (i[posy+-1][posx+-3] < c_b)
				  if (i[posy+0][posx+-3] < c_b)
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] < c_b)
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  return false;
				else
				 return false;
			   else
				return false;
			  else if (i[posy+2][posx+2] < c_b) 
			   if (i[posy+1][posx+3] > cb) 
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-3][posx+1] > cb) 
				  if (i[posy+-3][posx+0] > cb) 
				   if (i[posy+-3][posx+-1] > cb) 
					if (i[posy+-1][posx+-3] > cb) 
					 if (i[posy+-2][posx+2] > cb) 
					  if (i[posy+-1][posx+3] > cb) 
					   if (i[posy+0][posx+3] > cb) 
						return true;
					   else
						if (i[posy+0][posx+-3] > cb) 
						 if (i[posy+1][posx+-3] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					  else
					   if (i[posy+0][posx+-3] > cb) 
						if (i[posy+1][posx+-3] > cb) 
						 if (i[posy+2][posx+-2] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					 else
					  if (i[posy+0][posx+-3] > cb) 
					   if (i[posy+1][posx+-3] > cb) 
						if (i[posy+2][posx+-2] > cb) 
						 if (i[posy+3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
				else if (i[posy+-2][posx+-2] < c_b) 
				 if (i[posy+-1][posx+-3] < c_b)
				  if (i[posy+0][posx+-3] < c_b)
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			   else if (i[posy+1][posx+3] < c_b) 
				if (i[posy+0][posx+3] > cb) 
				 if (i[posy+1][posx+-3] > cb) 
				  if (i[posy+-3][posx+1] > cb) 
				   if (i[posy+-3][posx+0] > cb) 
					if (i[posy+-3][posx+-1] > cb) 
					 if (i[posy+-2][posx+-2] > cb) 
					  if (i[posy+-1][posx+-3] > cb) 
					   if (i[posy+0][posx+-3] > cb) 
						if (i[posy+-2][posx+2] > cb) 
						 if (i[posy+-1][posx+3] > cb) 
						  return true;
						 else
						  if (i[posy+2][posx+-2] > cb) 
						   return true;
						  else
						   return false;
						else
						 if (i[posy+2][posx+-2] > cb) 
						  if (i[posy+3][posx+-1] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else if (i[posy+1][posx+-3] < c_b) 
				  if (i[posy+-1][posx+-3] > cb) 
				   if (i[posy+-1][posx+3] > cb) 
					if (i[posy+-2][posx+2] > cb) 
					 if (i[posy+-3][posx+1] > cb) 
					  if (i[posy+-3][posx+0] > cb) 
					   if (i[posy+-3][posx+-1] > cb) 
						if (i[posy+-2][posx+-2] > cb) 
						 if (i[posy+0][posx+-3] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else if (i[posy+-1][posx+-3] < c_b) 
				   if (i[posy+0][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  if (i[posy+-2][posx+-2] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  if (i[posy+-2][posx+-2] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					return false;
				  else
				   return false;
				 else
				  if (i[posy+-1][posx+3] > cb) 
				   if (i[posy+-2][posx+2] > cb) 
					if (i[posy+-3][posx+1] > cb) 
					 if (i[posy+-3][posx+0] > cb) 
					  if (i[posy+-3][posx+-1] > cb) 
					   if (i[posy+-2][posx+-2] > cb) 
						if (i[posy+-1][posx+-3] > cb) 
						 if (i[posy+0][posx+-3] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else if (i[posy+0][posx+3] < c_b) 
				 if (i[posy+-1][posx+3] > cb) 
				  if (i[posy+2][posx+-2] > cb) 
				   if (i[posy+-3][posx+1] > cb) 
					if (i[posy+-3][posx+0] > cb) 
					 if (i[posy+-3][posx+-1] > cb) 
					  if (i[posy+-2][posx+-2] > cb) 
					   if (i[posy+-1][posx+-3] > cb) 
						if (i[posy+0][posx+-3] > cb) 
						 if (i[posy+1][posx+-3] > cb) 
						  if (i[posy+-2][posx+2] > cb) 
						   return true;
						  else
						   if (i[posy+3][posx+-1] > cb) 
							return true;
						   else
							return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else if (i[posy+2][posx+-2] < c_b) 
				   if (i[posy+0][posx+-3] > cb) 
					if (i[posy+-2][posx+2] > cb) 
					 if (i[posy+-3][posx+1] > cb) 
					  if (i[posy+-3][posx+0] > cb) 
					   if (i[posy+-3][posx+-1] > cb) 
						if (i[posy+-2][posx+-2] > cb) 
						 if (i[posy+-1][posx+-3] > cb) 
						  if (i[posy+1][posx+-3] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else if (i[posy+0][posx+-3] < c_b) 
					if (i[posy+1][posx+-3] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  if (i[posy+-2][posx+-2] < c_b)
						   if (i[posy+-1][posx+-3] < c_b)
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 return false;
				   else
					return false;
				  else
				   if (i[posy+-2][posx+2] > cb) 
					if (i[posy+-3][posx+1] > cb) 
					 if (i[posy+-3][posx+0] > cb) 
					  if (i[posy+-3][posx+-1] > cb) 
					   if (i[posy+-2][posx+-2] > cb) 
						if (i[posy+-1][posx+-3] > cb) 
						 if (i[posy+0][posx+-3] > cb) 
						  if (i[posy+1][posx+-3] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else if (i[posy+-1][posx+3] < c_b) 
				  if (i[posy+-2][posx+2] > cb) 
				   if (i[posy+3][posx+-1] < c_b)
					if (i[posy+1][posx+-3] > cb) 
					 if (i[posy+-3][posx+1] > cb) 
					  if (i[posy+-3][posx+0] > cb) 
					   if (i[posy+-3][posx+-1] > cb) 
						if (i[posy+-2][posx+-2] > cb) 
						 if (i[posy+-1][posx+-3] > cb) 
						  if (i[posy+0][posx+-3] > cb) 
						   if (i[posy+2][posx+-2] > cb) 
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else if (i[posy+1][posx+-3] < c_b) 
					 if (i[posy+2][posx+-2] < c_b)
					  return true;
					 else
					  return false;
					else
					 return false;
				   else
					if (i[posy+-3][posx+1] > cb) 
					 if (i[posy+-3][posx+0] > cb) 
					  if (i[posy+-3][posx+-1] > cb) 
					   if (i[posy+-2][posx+-2] > cb) 
						if (i[posy+-1][posx+-3] > cb) 
						 if (i[posy+0][posx+-3] > cb) 
						  if (i[posy+1][posx+-3] > cb) 
						   if (i[posy+2][posx+-2] > cb) 
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else if (i[posy+-2][posx+2] < c_b) 
				   if (i[posy+-3][posx+1] > cb) 
					if (i[posy+2][posx+-2] > cb) 
					 if (i[posy+-3][posx+0] > cb) 
					  if (i[posy+-3][posx+-1] > cb) 
					   if (i[posy+-2][posx+-2] > cb) 
						if (i[posy+-1][posx+-3] > cb) 
						 if (i[posy+0][posx+-3] > cb) 
						  if (i[posy+1][posx+-3] > cb) 
						   if (i[posy+3][posx+-1] > cb) 
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else if (i[posy+2][posx+-2] < c_b) 
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  return false;
					else
					 return false;
				   else if (i[posy+-3][posx+1] < c_b) 
					if (i[posy+-3][posx+0] < c_b)
					 return true;
					else
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  return false;
				   else
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+-3] > cb) 
					if (i[posy+-3][posx+1] > cb) 
					 if (i[posy+-3][posx+0] > cb) 
					  if (i[posy+-3][posx+-1] > cb) 
					   if (i[posy+-2][posx+-2] > cb) 
						if (i[posy+-1][posx+-3] > cb) 
						 if (i[posy+0][posx+-3] > cb) 
						  if (i[posy+2][posx+-2] > cb) 
						   if (i[posy+3][posx+-1] > cb) 
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else if (i[posy+1][posx+-3] < c_b) 
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+0][posx+-3] > cb) 
				   if (i[posy+-3][posx+1] > cb) 
					if (i[posy+-3][posx+0] > cb) 
					 if (i[posy+-3][posx+-1] > cb) 
					  if (i[posy+-2][posx+-2] > cb) 
					   if (i[posy+-1][posx+-3] > cb) 
						if (i[posy+1][posx+-3] > cb) 
						 if (i[posy+2][posx+-2] > cb) 
						  if (i[posy+-2][posx+2] > cb) 
						   return true;
						  else
						   if (i[posy+3][posx+-1] > cb) 
							return true;
						   else
							return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else if (i[posy+0][posx+-3] < c_b) 
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  if (i[posy+-2][posx+-2] < c_b)
						   if (i[posy+-1][posx+-3] < c_b)
							return true;
						   else
							return false;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 if (i[posy+-1][posx+-3] > cb) 
				  if (i[posy+-3][posx+1] > cb) 
				   if (i[posy+-3][posx+0] > cb) 
					if (i[posy+-3][posx+-1] > cb) 
					 if (i[posy+-2][posx+-2] > cb) 
					  if (i[posy+0][posx+-3] > cb) 
					   if (i[posy+1][posx+-3] > cb) 
						if (i[posy+-2][posx+2] > cb) 
						 if (i[posy+-1][posx+3] > cb) 
						  return true;
						 else
						  if (i[posy+2][posx+-2] > cb) 
						   return true;
						  else
						   return false;
						else
						 if (i[posy+2][posx+-2] > cb) 
						  if (i[posy+3][posx+-1] > cb) 
						   return true;
						  else
						   return false;
						 else
						  return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else if (i[posy+-1][posx+-3] < c_b) 
				  if (i[posy+0][posx+-3] < c_b)
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  if (i[posy+-2][posx+-2] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  if (i[posy+-2][posx+-2] < c_b)
						   return true;
						  else
						   return false;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
			   else
				if (i[posy+-2][posx+-2] > cb) 
				 if (i[posy+-3][posx+1] > cb) 
				  if (i[posy+-3][posx+0] > cb) 
				   if (i[posy+-3][posx+-1] > cb) 
					if (i[posy+-1][posx+-3] > cb) 
					 if (i[posy+0][posx+-3] > cb) 
					  if (i[posy+-2][posx+2] > cb) 
					   if (i[posy+-1][posx+3] > cb) 
						if (i[posy+0][posx+3] > cb) 
						 return true;
						else
						 if (i[posy+1][posx+-3] > cb) 
						  return true;
						 else
						  return false;
					   else
						if (i[posy+1][posx+-3] > cb) 
						 if (i[posy+2][posx+-2] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					  else
					   if (i[posy+1][posx+-3] > cb) 
						if (i[posy+2][posx+-2] > cb) 
						 if (i[posy+3][posx+-1] > cb) 
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
				else if (i[posy+-2][posx+-2] < c_b) 
				 if (i[posy+-1][posx+-3] < c_b)
				  if (i[posy+0][posx+-3] < c_b)
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 if (i[posy+-3][posx+-1] < c_b)
						  return true;
						 else
						  return false;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			  else
			   if (i[posy+-3][posx+-1] > cb) 
				if (i[posy+-3][posx+1] > cb) 
				 if (i[posy+-3][posx+0] > cb) 
				  if (i[posy+-2][posx+-2] > cb) 
				   if (i[posy+-1][posx+-3] > cb) 
					if (i[posy+-2][posx+2] > cb) 
					 if (i[posy+-1][posx+3] > cb) 
					  if (i[posy+0][posx+3] > cb) 
					   if (i[posy+1][posx+3] > cb) 
						return true;
					   else
						if (i[posy+0][posx+-3] > cb) 
						 return true;
						else
						 return false;
					  else
					   if (i[posy+0][posx+-3] > cb) 
						if (i[posy+1][posx+-3] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					 else
					  if (i[posy+0][posx+-3] > cb) 
					   if (i[posy+1][posx+-3] > cb) 
						if (i[posy+2][posx+-2] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+0][posx+-3] > cb) 
					  if (i[posy+1][posx+-3] > cb) 
					   if (i[posy+2][posx+-2] > cb) 
						if (i[posy+3][posx+-1] > cb) 
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
				else
				 return false;
			   else if (i[posy+-3][posx+-1] < c_b) 
				if (i[posy+-2][posx+-2] < c_b)
				 if (i[posy+-1][posx+-3] < c_b)
				  if (i[posy+0][posx+-3] < c_b)
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] < c_b)
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						if (i[posy+-3][posx+0] < c_b)
						 return true;
						else
						 return false;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  return false;
				else
				 return false;
			   else
				return false;
			 else
			  if (i[posy+-3][posx+0] > cb) 
			   if (i[posy+-3][posx+1] > cb) 
				if (i[posy+-3][posx+-1] > cb) 
				 if (i[posy+-2][posx+-2] > cb) 
				  if (i[posy+-2][posx+2] > cb) 
				   if (i[posy+-1][posx+3] > cb) 
					if (i[posy+0][posx+3] > cb) 
					 if (i[posy+1][posx+3] > cb) 
					  if (i[posy+2][posx+2] > cb) 
					   return true;
					  else
					   if (i[posy+-1][posx+-3] > cb) 
						return true;
					   else
						return false;
					 else
					  if (i[posy+-1][posx+-3] > cb) 
					   if (i[posy+0][posx+-3] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+-3] > cb) 
					  if (i[posy+0][posx+-3] > cb) 
					   if (i[posy+1][posx+-3] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-1][posx+-3] > cb) 
					 if (i[posy+0][posx+-3] > cb) 
					  if (i[posy+1][posx+-3] > cb) 
					   if (i[posy+2][posx+-2] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+-1][posx+-3] > cb) 
					if (i[posy+0][posx+-3] > cb) 
					 if (i[posy+1][posx+-3] > cb) 
					  if (i[posy+2][posx+-2] > cb) 
					   if (i[posy+3][posx+-1] > cb) 
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  return false;
				else
				 return false;
			   else
				return false;
			  else if (i[posy+-3][posx+0] < c_b) 
			   if (i[posy+-3][posx+-1] < c_b)
				if (i[posy+-2][posx+-2] < c_b)
				 if (i[posy+-1][posx+-3] < c_b)
				  if (i[posy+0][posx+-3] < c_b)
				   if (i[posy+1][posx+-3] < c_b)
					if (i[posy+2][posx+-2] < c_b)
					 if (i[posy+3][posx+-1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					else
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+1][posx+3] < c_b)
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+2][posx+2] < c_b)
				   if (i[posy+1][posx+3] < c_b)
					if (i[posy+0][posx+3] < c_b)
					 if (i[posy+-1][posx+3] < c_b)
					  if (i[posy+-2][posx+2] < c_b)
					   if (i[posy+-3][posx+1] < c_b)
						return true;
					   else
						return false;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 return false;
			   else
				return false;
			  else
			   return false;
			else
			 if (i[posy+-3][posx+1] > cb) 
			  if (i[posy+-3][posx+0] > cb) 
			   if (i[posy+-3][posx+-1] > cb) 
				if (i[posy+-2][posx+2] > cb) 
				 if (i[posy+-1][posx+3] > cb) 
				  if (i[posy+0][posx+3] > cb) 
				   if (i[posy+1][posx+3] > cb) 
					if (i[posy+2][posx+2] > cb) 
					 if (i[posy+3][posx+1] > cb) 
					  return true;
					 else
					  if (i[posy+-2][posx+-2] > cb) 
					   return true;
					  else
					   return false;
					else
					 if (i[posy+-2][posx+-2] > cb) 
					  if (i[posy+-1][posx+-3] > cb) 
					   return true;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-2][posx+-2] > cb) 
					 if (i[posy+-1][posx+-3] > cb) 
					  if (i[posy+0][posx+-3] > cb) 
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+-2][posx+-2] > cb) 
					if (i[posy+-1][posx+-3] > cb) 
					 if (i[posy+0][posx+-3] > cb) 
					  if (i[posy+1][posx+-3] > cb) 
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+-2][posx+-2] > cb) 
				   if (i[posy+-1][posx+-3] > cb) 
					if (i[posy+0][posx+-3] > cb) 
					 if (i[posy+1][posx+-3] > cb) 
					  if (i[posy+2][posx+-2] > cb) 
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 if (i[posy+-2][posx+-2] > cb) 
				  if (i[posy+-1][posx+-3] > cb) 
				   if (i[posy+0][posx+-3] > cb) 
					if (i[posy+1][posx+-3] > cb) 
					 if (i[posy+2][posx+-2] > cb) 
					  if (i[posy+3][posx+-1] > cb) 
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
			   else
				return false;
			  else
			   return false;
			 else if (i[posy+-3][posx+1] < c_b) 
			  if (i[posy+-3][posx+0] < c_b)
			   if (i[posy+-3][posx+-1] < c_b)
				if (i[posy+-2][posx+2] < c_b)
				 if (i[posy+-1][posx+3] < c_b)
				  if (i[posy+0][posx+3] < c_b)
				   if (i[posy+1][posx+3] < c_b)
					if (i[posy+2][posx+2] < c_b)
					 if (i[posy+3][posx+1] < c_b)
					  return true;
					 else
					  if (i[posy+-2][posx+-2] < c_b)
					   return true;
					  else
					   return false;
					else
					 if (i[posy+-2][posx+-2] < c_b)
					  if (i[posy+-1][posx+-3] < c_b)
					   return true;
					  else
					   return false;
					 else
					  return false;
				   else
					if (i[posy+-2][posx+-2] < c_b)
					 if (i[posy+-1][posx+-3] < c_b)
					  if (i[posy+0][posx+-3] < c_b)
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				  else
				   if (i[posy+-2][posx+-2] < c_b)
					if (i[posy+-1][posx+-3] < c_b)
					 if (i[posy+0][posx+-3] < c_b)
					  if (i[posy+1][posx+-3] < c_b)
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				 else
				  if (i[posy+-2][posx+-2] < c_b)
				   if (i[posy+-1][posx+-3] < c_b)
					if (i[posy+0][posx+-3] < c_b)
					 if (i[posy+1][posx+-3] < c_b)
					  if (i[posy+2][posx+-2] < c_b)
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				else
				 if (i[posy+-2][posx+-2] < c_b)
				  if (i[posy+-1][posx+-3] < c_b)
				   if (i[posy+0][posx+-3] < c_b)
					if (i[posy+1][posx+-3] < c_b)
					 if (i[posy+2][posx+-2] < c_b)
					  if (i[posy+3][posx+-1] < c_b)
					   return true;
					  else
					   return false;
					 else
					  return false;
					else
					 return false;
				   else
					return false;
				  else
				   return false;
				 else
				  return false;
			   else
				return false;
			  else
			   return false;
			 else
			  return false;
		}
		
		public static function corner_score(i:Vector.<Vector.<uint>>, posx:int, posy:int):int
		{
			var bmin:int = 0;
			var bmax:int = 255;
			var b:int = (bmax + bmin) / 2;
			
			//Compute the score using binary search
			while (true)
			{
				if (is_a_corner(i, posx, posy, b))
				{
					bmin = b;
				}
				else
				{
					bmax = b;
				}
				
				if (bmin == bmax - 1 || bmin == bmax)
				{
					return bmin;
				}
				
				b = (bmin + bmax) / 2;
			}
			
			return 0;
		}
	}

}