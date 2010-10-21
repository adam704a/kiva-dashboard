package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetLoanDetailEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getKivaLoanDetails";
		public var kivaLoanId:String;
		
		public function GetLoanDetailEvent(kivaLoanId:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.kivaLoanId = kivaLoanId;
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}