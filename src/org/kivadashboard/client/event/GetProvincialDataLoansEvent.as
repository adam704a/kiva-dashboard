package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;

	public class GetProvincialDataLoansEvent extends CairngormEvent
	{
		public static var EVENT_NAME: String = "getProvincialDataLoansEvent";
		public var xmlUrl:String;
		
		public function GetProvincialDataLoansEvent(xmlUrl:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.xmlUrl = xmlUrl;
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}