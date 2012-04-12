package  
{
	import BRIEF.Testset;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class DescriptorTest extends Main
	{
		
		private var testset:Testset = new Testset();
		
		public function DescriptorTest() 
		{
			var bmp:BitmapData = new BitmapData(9, 9, false, 0);
			
			addChild(new Bitmap(bmp));
		}
		
		
		
	}

}