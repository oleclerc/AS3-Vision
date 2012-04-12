package  
{
	import BRIEF.Testset;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class DescriptorTest extends Sprite
	{
		
		private var testset:Testset = new Testset();
		
		public function DescriptorTest() 
		{
			testset.InitRandom(32);
		}
		
		public function DescribeFeature(bmp:BitmapData, feature:Point):void
		{
			var bitfield:String = ""; //TODO pack directly as bits in uint(s)
			
			var len:int = testset.testP1.length;
			for (var i:int = 0; i < len; i++)
			{
				var pix1:uint = bmp.getPixel(feature.x + testset.testP1[i].x, feature.y + testset.testP1[i].y);
				var pix2:uint = bmp.getPixel(feature.x + testset.testP2[i].x, feature.y + testset.testP2[i].y);
				if ((pix1 & 0x000000ff) > (pix2 & 0x000000ff))
				{
					bitfield += "1";
				}
				else
				{
					bitfield += "0";
				}
			}
			
			trace(bitfield);
		}
		
	}

}