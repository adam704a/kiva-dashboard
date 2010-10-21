package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetJournalsEvent extends CairngormEvent
	{
		
		public static var EVENT_NAME: String = "getJournalsEvent";
		public var partnerId:String;
		public var pageNumber:Number;
		
		public function GetJournalsEvent(partnerId:String, pageNumber:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.partnerId = partnerId;
			this.pageNumber = pageNumber;
			super(EVENT_NAME, bubbles, cancelable);
		}

	}
}