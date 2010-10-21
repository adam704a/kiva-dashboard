package org.kivadashboard.client.event
{
	import mx.events.FlexEvent;

	public class UpdateGraphDataEvent extends FlexEvent
	{
		
		public static var EVENT_NAME:String = "updateGraphDataEvent";
		
		public function UpdateGraphDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}