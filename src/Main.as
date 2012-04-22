package 
{
	import Descriptor.BRIEFDescriptor;
	import Detector.Fast9Detector;
	import flash.events.KeyboardEvent;
	import flash.filters.ColorMatrixFilter;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import General.Feature
	import General.Param;
	import General.Util;
	import Matcher.MatchBruteforce;
	
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
	import ImageSource.SourceWebcam;
	
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class Main extends Sprite 
	{
		private var WebcamResX:Param = new Param("WebcamResX", 640);
		private var WebcamResY:Param = new Param("WebcamResY", 480);
		private var ImageWidth:Param = new Param("ImageWidth", 320);
		private var ImageHeight:Param = new Param("ImageHeight", 240);
		private var Fast9Threshold:Param = new Param("Fast9Threshold", 40);
		private var WantedFeatureCount:Param = new Param("WantedFeatureCount", 160);
		
		
		private var imgSource:SourceWebcam
		private var inputImage:BitmapData;
		private var overlay:Sprite;
		private var greyscaleFilter:ColorMatrixFilter;
		
		private var prevFeatures:Vector.<Feature> = null;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(Event.ENTER_FRAME, OnEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, OnKeyDown);
			
			//Create image source
			imgSource = new SourceWebcam(WebcamResX.value, WebcamResY.value, ImageWidth.value, ImageHeight.value);
			addChild(imgSource);
			
			var matrix:Array = new Array();
			matrix = matrix.concat([0.333,0.333,0.333,0,0]);
			matrix = matrix.concat([0.333,0.333,0.333,0,0]);
			matrix = matrix.concat([0.333,0.333,0.333,0,0]);
			matrix = matrix.concat([0, 0, 0, 1, 0]);
			greyscaleFilter = new ColorMatrixFilter(matrix);
			
			//Create overlay
			overlay = new Sprite();
			overlay.scaleX = WebcamResX.value / ImageWidth.value;
			overlay.scaleY = WebcamResY.value / ImageHeight.value;
			addChild(overlay);
			
			//Init testset
			BRIEFDescriptor.testset.InitRandom(BRIEFDescriptor.BRIEFSize.value);
			
			//Show testset rendering
			var ts:Sprite = new Sprite();
			ts.x = 680;
			ts.y = 50;
			ts.graphics.lineStyle(1);
			BRIEFDescriptor.testset.Render(ts.graphics, 5);
			addChild(ts);
			
			//addChild(new Bitmap(imgSource.GetCurrentFrame()));
		}
		
		private function OnEnterFrame(e:Event):void
		{
			inputImage = imgSource.GetCurrentFrame();
			
			var nbFeatures:int = Process(inputImage);
			trace("Threshold: " + Fast9Threshold.value + " NbFeatures: " + nbFeatures);
			if (Math.abs(nbFeatures - WantedFeatureCount.value) > (WantedFeatureCount.value / 8))
			{
				if (nbFeatures < WantedFeatureCount.value) Fast9Threshold.value--;
				if (nbFeatures > WantedFeatureCount.value) Fast9Threshold.value++;
				
				if (Fast9Threshold.value < 5) Fast9Threshold.value = 5;
				if (Fast9Threshold.value > 140) Fast9Threshold.value = 140;
			}
		}
		
		private function OnKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.P)
			{
				trace("Parameters:");
				Param.TraceAll();
			}
		}
		
		private function Process(input:BitmapData):int
		{
			var before:int = getTimer();
			var features:Vector.<Feature> = DetectFeatures(input);
			trace("Detection: " + (getTimer() - before));
			
			DescribeFeatures(input, features);
			
			//cutoff if too many features, to avoid lag when debugging
			if (prevFeatures != null && prevFeatures.length < 300 && features.length < 300)
			{
				//Match previous frame features with current frame features
				MatchBruteforce.Match(prevFeatures, features);
				
				RenderOverlay(features);
			}
			
			this.prevFeatures = features;
			return features.length;
		}
		
		private function DescribeFeatures(image:BitmapData, features:Vector.<Feature>):void
		{
			//Compute descriptors
			for each (var f:Feature in features)
			{
				BRIEFDescriptor.DescribeFeature(image, f);
			}
		}
		
		private function DetectFeatures(img:BitmapData):Vector.<Feature>
		{
			if (img.width != ImageWidth.value || img.height != ImageHeight.value)
				throw new Error("Image must be of the right size");
			
			//Greyscale in blue component
			img.applyFilter(img, img.rect, new Point(),  greyscaleFilter);
			
			//Detect
			var features:Vector.<Feature> = Fast9Detector.Detect(img, Fast9Threshold.value);
			return features;
		}
		
		//Render features in red and their match in green
		private function RenderOverlay(features:Vector.<Feature>):void
		{
			overlay.graphics.clear();
			for each (var f:Feature in features)
			{
				if (f.match != null && f.consecutiveMatches >= 2)
				{
					//overlay.graphics.lineStyle(1, 0xff0000);
					//overlay.graphics.drawCircle(f.pos.x, f.pos.y, 2);
					
					overlay.graphics.lineStyle(1, 0x3300ff);
					overlay.graphics.moveTo(f.pos.x, f.pos.y);
					overlay.graphics.lineTo(f.match.pos.x, f.match.pos.y);
					
					//overlay.graphics.lineStyle(1, 0x00ff00);
					//overlay.graphics.drawCircle(f.match.pos.x, f.match.pos.y, 2);
				}
			}
		}
		
	}
	
}