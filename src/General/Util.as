package General 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Util 
	{
		
		public function Util() 
		{
			
		}
		
		//TODO test this function
		public static function IntersectCircleRect(circle:Circle, rect:Rectangle):Boolean
		{
			var circleDistanceX:Number = Math.abs(circle.x - rect.x - rect.width/2);
			var circleDistanceY:Number = Math.abs(circle.y - rect.y - rect.height / 2);
			
			if (circleDistanceX > (rect.width/2 + circle.r)) { return false; }
			if (circleDistanceY > (rect.height / 2 + circle.r)) { return false; }
			
			if (circleDistanceX <= (rect.width/2)) { return true; } 
			if (circleDistanceY <= (rect.height / 2)) { return true; }
			
			var cornerDistance_sq:Number = (circleDistanceX - rect.width / 2) ^ 2 + (circleDistanceY - rect.height / 2) ^ 2;
			
			return (cornerDistance_sq <= (circle.r^2));
		}
		
	}

}