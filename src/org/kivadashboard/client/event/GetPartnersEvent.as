package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetPartnersEvent extends CairngormEvent
	{
		public static var EVENT_NAME: String = "getPartnersEvent";
		public var page:Number;
		
		public function GetPartnersEvent(bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}