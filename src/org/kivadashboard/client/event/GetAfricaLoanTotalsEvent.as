package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetAfricaLoanTotalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getAfricaLoanTotalsEvent";
		
		public function GetAfricaLoanTotalsEvent( bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}