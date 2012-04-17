package Detector
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import General.Feature;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Fast9Detector 
	{
		
		public function Fast9Detector() 
		{
			
		}
		
		public static function Detect(im:BitmapData, threshold:int):Vector.<Feature>
		{
			var num_corners:int = 0;
			var ret_corners:Vector.<Feature>;
			var x:int, y:int;
			
			ret_corners = new Vector.<Feature>();
			
			//Create 2D vector for image pixels, using only the blue channel (will work with greyscale images)
			var image:Vector.<Vector.<uint>> = new Vector.<Vector.<uint>>(im.height);
			for (y = 0; y < im.height; y++)
			{
				image[y] = new Vector.<uint>(im.width);
				image[y].fixed = true;
				for (x = 0; x < im.width; x++)
				{
					image[y][x] = im.getPixel(x, y) & 0x0000ff;
				}
			}
			
			var xsize:int = im.width - 5;
			var ysize:int = im.height - 5;
			for(y = 5; y < ysize; y++)
				for(x = 5; x < xsize; x++)
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
			
			return ret_corners;
		}
		
	}

}