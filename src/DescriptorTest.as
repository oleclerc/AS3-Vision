package  
{
	import BRIEF.Descriptor;
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
		private var BRIEFSize:Param = new Param("BRIEFsize", 256);
		
		private var testset:Testset = new Testset();
		
		public function DescriptorTest() 
		{
			testset.InitRandom(BRIEFSize.value);
		}
		
		public function DescribeFeature(bmp:BitmapData, feature:Feature):void
		{
			var descriptor:Descriptor = new Descriptor(BRIEFSize.value);
			
			var len:int = testset.testP1.length;
			for (var u:int = 0; u < BRIEFSize.value; u += 32) //for every uint
			{
				var currentUint:uint = 0;
				for (var i:int = 0; i < 32; i++) //for every bit
				{
					var pix1:uint = bmp.getPixel(feature.pos.x + testset.testP1[i+u].x, feature.pos.y + testset.testP1[i+u].y);
					var pix2:uint = bmp.getPixel(feature.pos.x + testset.testP2[i+u].x, feature.pos.y + testset.testP2[i+u].y);
					if ((pix1 & 0x000000ff) > (pix2 & 0x000000ff))
					{
						currentUint += (1 << i);
					}
				}
				descriptor.chunks[u / 32] = currentUint;
			}
			
			feature.descriptor = descriptor;
		}
		
	}

}