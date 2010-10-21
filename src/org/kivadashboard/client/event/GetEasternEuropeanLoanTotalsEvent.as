package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetEasternEuropeanLoanTotalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getEasternEuropeanLoanTotalsEvent";
		
		public function GetEasternEuropeanLoanTotalsEvent( bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}