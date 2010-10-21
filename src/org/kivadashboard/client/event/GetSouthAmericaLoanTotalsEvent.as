package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetSouthAmericaLoanTotalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getSouthAmericaLoanTotalsEvent";
		
		public function GetSouthAmericaLoanTotalsEvent( bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}