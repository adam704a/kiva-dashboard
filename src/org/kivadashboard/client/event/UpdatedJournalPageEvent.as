package org.kivadashboard.client.event
{
	import mx.events.FlexEvent;

	public class UpdatedJournalPageEvent extends FlexEvent
	{
		
		public static var EVENT_NAME:String = "updatedJournalPageEvent";
		public var currentPage:Number;
		public var totalPages:Number;
		
		public function UpdatedJournalPageEvent(currentPage:Number, totalPages:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.currentPage = currentPage;
			this.totalPages = totalPages;
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}