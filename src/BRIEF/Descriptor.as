package BRIEF 
{
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Descriptor 
	{
		
		public var chunks:Vector.<uint>;
		
		public function Descriptor(nbBits:uint = 32)
		{
			if (nbBits % 32 != 0) throw new Error("nbBits must be a multiple of 32");
			
			chunks = new Vector.<uint>(nbBits/32); //pack 32 bits per uint
			chunks.fixed = true;
		}
		
		//returns the number of bits that are different
		public function Compare(other:Descriptor):int
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