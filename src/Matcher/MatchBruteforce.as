package Matcher
{
	import Descriptor.BRIEFDescriptor;
	import flash.geom.Point;
	import General.Feature;
	import General.Param;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class MatchBruteforce 
	{
		private static var MAX_DIFFERENCE:Param = new Param("MATCH_MAX_DIFFERENCE", 16);
		private static var MAX_DISTANCE:Param = new Param("MATCH_MAX_DISTANCE", 20);
		
		public function MatchBruteforce() 
		{
			
		}
		
		//for every feature in listB, compute their best match from listA
		public static function Match(listA:Vector.<Feature>, listB:Vector.<Feature>):void
		{
			for each (var f1:Feature in listB)
			{
				var bestScore:int = int.MAX_VALUE;
				var bestMatch:Feature = null;
				for each (var f2:Feature in listA)
				{
					if (Point.distance(f1.pos, f2.pos) < MAX_DISTANCE.value)
					{
						var difference:int = f1.descriptor.Compare(f2.descriptor);
						if (difference < bestScore)
						{
							bestScore = difference;
							bestMatch = f2;
						}
					}
				}
				
				if (bestScore < MAX_DIFFERENCE.value)
				{
					f1.match = bestMatch;
					f1.consecutiveMatches = bestMatch.consecutiveMatches + 1;
				}
			}
		}
		
	}

}