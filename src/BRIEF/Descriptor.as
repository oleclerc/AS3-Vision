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
			var bin:String = '';
			for(var i:uint = 0; i < 32; i++) {
				bin += String((num & (0x80 >> i)) >> (7 - i));
			}
			
			return bin;
		}
	}

}