package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Fast9Detector 
	{
		
		public function Fast9Detector() 
		{
			
		}
		
		public static function Detect(im:BitmapData, threshold:int):Vector.<Point>
		{
			var num_corners:int = 0;
			var ret_corners:Vector.<Point>;
			var rsize:int = 512;
			var x:int, y:int;
			
			ret_corners = new Vector.<Point>();
			
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
			
			var xsize:int = im.width - 3;
			var ysize:int = im.height - 3;
			for(y = 3; y < ysize; y++)
				for(x = 3; x < xsize; x++)
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
					
				ret_corners.push(new Point(x,y));
			}
			
			return ret_corners;
		}
		
	}

}