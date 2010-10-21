package org.kivadashboard.client.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;

	public class GetLoansEvent extends CairngormEvent
	{
		
		public var parameters:Object;
		public static var EVENT_NAME: String = "getLoansEvent";
		
		public function GetLoansEvent(parameters:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.parameters = parameters;
			super(EVENT_NAME, bubbles, cancelable);
		}
		
	}
}