package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetNorthAmericaLoanTotalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getNorthAmericaLoanTotalsEvent";
		
		public function GetNorthAmericaLoanTotalsEvent( bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}