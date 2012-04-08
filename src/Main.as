package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Main extends Sprite 
	{
		private var ImageWidth:Param = new Param("ImageWidth", 256);
		private var ImageHeight:Param = new Param("ImageHeight", 256);
		private var Fast9Threshold:Param = new Param("Fast9Threshold", 100);
		
		private var inputImage:BitmapData;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, OnImageLoaded);
			loader.load(new URLRequest("test.jpg"));
		}
		
		private function OnImageLoaded(e:Event):void
		{
			var data:BitmapData = e.target.content.bitmapData;
			inputImage = new BitmapData(ImageWidth.value, ImageHeight.value, false);
			var scale:Matrix = new Matrix();
			scale.scale(ImageWidth.value / data.width, ImageHeight.value / data.height);
			inputImage.draw(data, scale);
			
			addChild(new Bitmap(inputImage));
			
			//Greyscale in blue component
			var blueScale:BitmapData = new BitmapData(ImageWidth.value, ImageHeight.value, false);
			for(var y:int = 0; y < inputImage.height; y++)
			{	
				for (var x:int = 0; x < inputImage.width; x++)
				{
					var pix:uint = inputImage.getPixel(x, y);
					pix = (((pix & 0xff0000) >> 16) + ((pix & 0x00ff00) >> 8) + (pix & 0x0000ff)) / 3;
					blueScale.setPixel(x, y, pix);
				}
			}
			
			//Detect
			var wantedFeatures:int = 1000;
			var lastDetectionCount:int = 0;
			var features:Vector.<Point>;
			while (Math.abs(lastDetectionCount - wantedFeatures) > (wantedFeatures / 10)) //Loop is for threshold optimization, later do this on multiple frames to adapt (video/webcam)
			{
				trace("Threshold: " + Fast9Threshold.value);
				features = Fast9Detector.Detect(blueScale, Fast9Threshold.value);
				
				lastDetectionCount = features.length;
				Fast9Threshold.value += (lastDetectionCount > wantedFeatures) ? 2 : -2;
			}
			for each (var p:Point in features)
			{
				inputImage.fillRect(new Rectangle(p.x - 1, p.y - 1, 2, 2), 0xff0000);
			}
		}
		
		
	}
	
}