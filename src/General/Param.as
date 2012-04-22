package General
{
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Param 
	{
		public static var ParamList:Array = new Array();
		
		public var name:String;
		public var value:Number;
		
		public function Param(name:String, value:Number) 
		{
			this.name = name;
			this.value = value;
			
			ParamList.push(this);
		}
		
		public static function TraceAll():void
		{
			for each (var p:Param in ParamList)
			{
				trace(p.name + ": " + p.value);
			}
		}
		
	}

}