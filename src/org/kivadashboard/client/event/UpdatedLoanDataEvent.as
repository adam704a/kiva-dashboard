package org.kivadashboard.client.event
{
	import mx.events.FlexEvent;

	public class UpdatedLoanDataEvent extends FlexEvent
	{
		
		public static var EVENT_NAME:String = "updateLoanDataEvent";
		
		public function UpdatedLoanDataEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}