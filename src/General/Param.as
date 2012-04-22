package General
{
	import com.bit101.components.Label;
	import com.bit101.components.Slider;
	import com.bit101.components.Text;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Param 
	{
		public static var ParamList:Array = new Array();
		
		public var name:String;
		public var value:Number;
		
		public var rangeLow:Number;
		public var rangeHigh:Number;
		
		public function Param(name:String, value:Number, rangeLow:Number = NaN, rangeHigh:Number = NaN) 
		{
			if (isNaN(rangeLow)) rangeLow = value / 2;
			if (isNaN(rangeHigh)) rangeHigh = value * 2;
			
			this.name = name;
			this.value = value;
			
			this.rangeLow = rangeLow;
			this.rangeHigh = rangeHigh;
			
			ParamList.push(this);
		}
		
		public function OnParamChange(e:Event):void
		{
			value = (e.target as Slider).value;
			trace(value);
		}
		
		public static function TraceAll():void
		{
			for each (var p:Param in ParamList)
			{
				trace(p.name + ": " + p.value);
			}
		}
		
		public static function CreateSettingPanel():Sprite
		{
			var panel:Sprite = new Sprite();
			
			var ypos:int = 0;
			for each (var p:Param in ParamList)
			{
				new Label(panel, 0, ypos-5, p.name);
				var slider:Slider = new Slider("horizontal", panel, 80, ypos, p.OnParamChange);
				
				slider.width = 150;
				slider.minimum = p.rangeLow;
				slider.maximum = p.rangeHigh;
				slider.value = p.value;
				ypos += 25;
			}
			
			return panel;
		}
		
	}

}