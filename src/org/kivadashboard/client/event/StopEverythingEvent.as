package org.kivadashboard.client.event
{
	import mx.events.FlexEvent;

	public class StopEverythingEvent extends FlexEvent
	{
		
		
		public static var EVENT_NAME: String = "stopEverythingEvent";
		public var faultString:String;
		
		public function StopEverythingEvent( faultString:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.faultString = faultString;
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}