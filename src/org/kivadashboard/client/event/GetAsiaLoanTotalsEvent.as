package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetAsiaLoanTotalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getAsiaLoanTotalsEvent";
		
		public function GetAsiaLoanTotalsEvent( bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}