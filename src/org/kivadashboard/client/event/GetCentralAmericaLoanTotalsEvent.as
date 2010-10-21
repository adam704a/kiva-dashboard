package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetCentralAmericaLoanTotalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getCentralAmericaLoanTotalsEvent";
		
		public function GetCentralAmericaLoanTotalsEvent( bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}