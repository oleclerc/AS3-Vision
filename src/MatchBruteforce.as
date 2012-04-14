package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class MatchBruteforce 
	{
		
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
					var difference:int = f1.descriptor.Compare(f2.descriptor);
					if (difference < bestScore)
					{
						bestScore = difference;
						bestMatch = f2;
					}
				}
				if (bestMatch != null && Point.distance(f1.pos, bestMatch.pos) < 20)
				{
					f1.match = bestMatch;
					if (bestMatch.match != null)
						f1.consecutiveMatches += bestMatch.consecutiveMatches;
				}
			}
		}
		
	}

}