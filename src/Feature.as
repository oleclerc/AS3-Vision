package  
{
	import BRIEF.Descriptor;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Feature 
	{
		public var pos:Point;
		public var descriptor:Descriptor;
		public var match:Feature;
		public var consecutiveMatches:int = 1;
		
		public function Feature() 
		{
			
		}
		
	}

}