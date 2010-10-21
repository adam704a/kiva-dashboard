package org.kivadashboard.client.event
{
	import mx.events.FlexEvent;

	public class UpdatedJournalUsersEvent extends FlexEvent
	{
		
		public static var EVENT_NAME:String = "updatedJournalUsersEvent";
		
		public function UpdatedJournalUsersEvent(bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}