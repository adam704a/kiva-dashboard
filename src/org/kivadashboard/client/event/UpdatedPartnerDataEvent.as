package org.kivadashboard.client.event
{
	import mx.events.FlexEvent;

	public class UpdatedPartnerDataEvent extends FlexEvent
	{
		public static var EVENT_NAME:String = "updatedPartnerDataEvent";
		
		public function UpdatedPartnerDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}