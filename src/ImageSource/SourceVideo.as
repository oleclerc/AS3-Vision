package ImageSource 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class SourceVideo extends Sprite
	{
		
		private var video:Video;
		private var scaleMatrix:Matrix;
		private var currentFrame:BitmapData;
		
		public function SourceVideo() 
		{
			
			var netConnect:NetConnection = new NetConnection();
			netConnect.connect(null);
			var ns:NetStream = new NetStream(netConnect);
			ns.client = new Object();
			ns.client.onMetaData = OnMetaData;
            ns.addEventListener(AsyncErrorEvent.ASYNC_ERROR, AsyncErrorHandler);
            ns.play("../test.flv");
			
			video = new Video(480,360);
			video.attachNetStream(ns);
			//video.filters = [new BlurFilter(BlurSize.value, BlurSize.value, BlurAmount.value)];
			currentFrame = new BitmapData(Main.ImageWidth.value, Main.ImageHeight.value, false);
			
			scaleMatrix = new Matrix();
			scaleMatrix.scale(Main.ImageWidth.value / video.width, Main.ImageHeight.value / video.height);
			
			addChild(video);
			
			//addChild(new Bitmap(currentFrame));
		}
		
		private function AsyncErrorHandler(e:AsyncErrorEvent):void
		{
			
		}
		
		private function OnMetaData(e:Object):void
		{
			
		}
		
		public function GetCurrentFrame():BitmapData
		{
			currentFrame.draw(video, scaleMatrix);
			return currentFrame;
		}
		
	}

}