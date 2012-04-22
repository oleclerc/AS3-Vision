package Descriptor 
{
	import flash.display.Graphics;
	import flash.geom.Point;
	import General.Param;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class BRIEFTestset 
	{
		private var KernelSize:Param = new Param("KernelSize", 9);
		
		//Two lists of pixels to be compared around center (P1-P2)
		public var testP1:Vector.<Point>;
		public var testP2:Vector.<Point>;
		
		public function BRIEFTestset() 
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
				testP1[i] = new Point(RandomInKernel(), RandomInKernel());
				testP2[i] = new Point(RandomInKernel(), RandomInKernel());
			}
		}
		
		private function RandomInKernel():int
		{
			return Math.round(Math.random() * (KernelSize.value-1)) - (KernelSize.value / 2);
		}
		
		public function Render(target:Graphics, scale:int = 1):void
		{
			for (var i:int = 0; i < testP1.length; i++)
			{
				target.moveTo(testP1[i].x * scale, testP1[i].y * scale);
				target.lineTo(testP2[i].x * scale, testP2[i].y * scale);
			}
		}
		
	}

}