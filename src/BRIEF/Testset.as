package BRIEF 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Testset 
	{
		//Two lists of pixels to be compared around center (P1-P2)
		public var testP1:Vector.<Point>;
		public var testP2:Vector.<Point>;
		
		public function Testset() 
		{
			
		}
		
		public function InitRandom(nbTests:int):void
		{
			testP1 = new Vector.<Point>();
			testP1.length = nbTests;
			testP1.fixed = true;
			testP2 = new Vector.<Point>();
			testP2.length = nbTests;
			testP2.fixed = true;
			
			for (var i:int = 0; i < nbTests; i++)
			{
				testP1[i].x = Math.round(Math.random() * 9) - 5;
				testP1[i].y = Math.round(Math.random() * 9) - 5;
				testP2[i].x = Math.round(Math.random() * 9) - 5;
				testP2[i].y = Math.round(Math.random() * 9) - 5;
			}
		}
		
		//TODO method to render the testset visually (for demo/debugging)
		
	}

}