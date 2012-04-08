package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Main extends Sprite 
	{
		private var ImageWidth:Param = new Param("ImageWidth", 320);
		private var ImageHeight:Param = new Param("ImageHeight", 240);
		private var Fast9Threshold:Param = new Param("Fast9Threshold", 30);
		private var WantedFeatureCount:Param = new Param("WantedFeatureCount", 1000);
		
		private var inputImage:BitmapData;
		private var video:Video;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.addEventListener(Event.ENTER_FRAME, OnEnterFrame);
			
			var cam:Camera = Camera.getCamera();
			cam.setMode(640, 480, 30, false);
			video = new Video(ImageWidth.value, ImageHeight.value);
			video.attachCamera(cam);
			video.filters = [new BlurFilter(3, 3, 1)];
			//addChild(video);
			inputImage = new BitmapData(ImageWidth.value, ImageHeight.value, false);
			addChild(new Bitmap(inputImage));
			
			//var loader:Loader = new Loader();
			//loader.contentLoaderInfo.addEventListener(Event.COMPLETE, OnImageLoaded);
			//loader.load(new URLRequest("test.jpg"));
		}
		
		private function OnEnterFrame(e:Event):void
		{
			inputImage.draw(video);
			
			var nbFeatures:int = Process(inputImage);
			trace("Threshold: " + Fast9Threshold.value + " NbFeatures: " + nbFeatures);
			if (Math.abs(nbFeatures - WantedFeatureCount.value) > (WantedFeatureCount.value / 10))
			{
				if (nbFeatures < WantedFeatureCount.value) Fast9Threshold.value--;
				if (nbFeatures > WantedFeatureCount.value) Fast9Threshold.value++;
				
				if (Fast9Threshold.value < 5) Fast9Threshold.value = 5;
				if (Fast9Threshold.value > 140) Fast9Threshold.value = 140;
			}
		}
		
		/*private function OnImageLoaded(e:Event):void
		{
			var data:BitmapData = e.target.content.bitmapData;
			Process(data);
		}*/
		
		private function Process(input:BitmapData):int
		{
			//var scaledImg:BitmapData = PrepareImage(input);
			
			var features:Vector.<Point> = DetectFeatures(input);
			
			for each (var p:Point in features)
			{
				input.fillRect(new Rectangle(p.x - 1, p.y - 1, 2, 2), 0xff0000);
			}
			
			return features.length;
		}
		
		private function PrepareImage(source:BitmapData):BitmapData
		{
			var img:BitmapData = new BitmapData(ImageWidth.value, ImageHeight.value, false);
			var scale:Matrix = new Matrix();
			scale.scale(ImageWidth.value / source.width, ImageHeight.value / source.height);
			img.draw(source, scale);
			
			return img;
		}
		
		private function DetectFeatures(img:BitmapData):Vector.<Point>
		{
			if (img.width != ImageWidth.value || img.height != ImageHeight.value)
				throw new Error("Image must be of the right size");
			
			//Greyscale in blue component
			var blueScale:BitmapData = new BitmapData(ImageWidth.value, ImageHeight.value, false);
			for(var y:int = 0; y < ImageHeight.value; y++)
			{	
				for (var x:int = 0; x < ImageWidth.value; x++)
				{
					var pix:uint = img.getPixel(x, y);
					pix = (((pix & 0xff0000) >> 16) + ((pix & 0x00ff00) >> 8) + (pix & 0x0000ff)) / 3;
					blueScale.setPixel(x, y, pix);
				}
			}
			
			//Detect
			var features:Vector.<Point>;
			features = Fast9Detector.Detect(blueScale, Fast9Threshold.value);
			return features;
		}
		
		
	}
	
}