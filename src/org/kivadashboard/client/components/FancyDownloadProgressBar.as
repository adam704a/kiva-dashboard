package org.kivadashboard.client.components
{
	import flash.events.ProgressEvent;
	
	import mx.preloaders.DownloadProgressBar;

	public class FancyDownloadProgressBar extends DownloadProgressBar
	{
		public function FancyDownloadProgressBar()
		{
			super();
			// Set the download label.
			downloadingLabel="Downloading app..."

			// Set the initialization label.
			initializingLabel="Initializing app..."
			
			// Set the minimum display time to 2 seconds.
			MINIMUM_DISPLAY_TIME=2000;
		}
		// Override to return true so progress bar appears
		// during initialization.
		override protected function showDisplayForInit(elapsedTime:int,count:int):Boolean {
			return true;
		}
		// Override to return true so progress bar appears during download.
		override protected function showDisplayForDownloading(elapsedTime:int, event:ProgressEvent):Boolean {
			return true;
		}
	
		
	}
}