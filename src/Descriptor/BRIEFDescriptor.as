package Descriptor 
{
	import flash.display.BitmapData;
	import General.Feature;
	import General.Param;
	
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class BRIEFDescriptor 
	{
		public static var BRIEFSize:Param = new Param("BRIEFsize", 128);
		public static var testset:BRIEFTestset = new BRIEFTestset();
		
		public var chunks:Vector.<uint>;
		
		public function BRIEFDescriptor(nbBits:uint = 32)
		{
			if (nbBits % 32 != 0) throw new Error("nbBits must be a multiple of 32");
			
			chunks = new Vector.<uint>(nbBits/32); //pack 32 bits per uint
			chunks.fixed = true;
		}
		
		public static function DescribeFeature(bmp:BitmapData, feature:Feature):void
		{
			var descriptor:BRIEFDescriptor = new BRIEFDescriptor(BRIEFSize.value);
			
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
		
		//returns the number of bits that are different
		public function Compare(other:BRIEFDescriptor):int
		{
			var score:int = 0;
			for (var i:int = 0; i < chunks.length; i++)
			{
				var xor:uint = chunks[i] ^ other.chunks[i];
				score += CountBits(xor);
			}
			return score;
		}
		
		public function ToString():String
		{
			var out:String = "";
			for each (var i:uint in chunks)
			{
				out += UIntToBinary(i);
			}
			return out;
		}
		
		private static function UIntToBinary(num:uint):String
		{
			var bin:String = "";
			for(var i:uint = 0; i < 32; i++) {
				bin += String((num & (0x80 >> i)) >> (7 - i));
			}
			
			return bin;
		}
		
		//TODO precompute every bitcount from every 8-bits numbers
		private static function CountBits(n:uint):uint
		{
			var tmp:uint = n - ((n >> 1) & 033333333333) - ((n >> 2) & 011111111111);
			return ((tmp + (tmp >> 3)) & 030707070707) % 63;
		}
		
	}

}