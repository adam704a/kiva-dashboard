package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetMiddleEastLoanTotalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getMiddleEastLoanTotalsEvent";
		
		public function GetMiddleEastLoanTotalsEvent( bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}