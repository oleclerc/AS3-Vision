package ImageSource 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.media.Camera;
	import flash.media.Video;
	import General.Param;
	/**
	 * ...
	 * @author Olivier Leclerc
	 */
	public class SourceWebcam extends Sprite
	{
		private var cam:Camera;
		private var video:Video;
		private var scaleMatrix:Matrix;
		private var currentFrame:BitmapData;
		
		public function SourceWebcam(camWidth:int, camHeight:int, scaledWidth:int, scaledHeight:int)
		{
			cam = Camera.getCamera();
			cam.setMode(camWidth, camHeight, 30, false);
			video = new Video(camWidth, camHeight);
			video.attachCamera(cam);
			video.filters = [new BlurFilter(Main.BlurSize.value, Main.BlurSize.value, Main.BlurAmount.value)];
			
			currentFrame = new BitmapData(scaledWidth, scaledHeight, false);
			
			scaleMatrix = new Matrix();
			scaleMatrix.scale(scaledWidth / camWidth, scaledHeight / camHeight);
			
			addChild(video);
		}
		
		public function GetCurrentFrame():BitmapData
		{
			currentFrame.draw(video, scaleMatrix);
			return currentFrame;
		}
		
	}

}