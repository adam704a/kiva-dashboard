package org.kivadashboard.client.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	public class GetJournalsDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function GetJournalsDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getHTTPService("journalService");
			this.responder = responder;
		}
		
		public function getJournals(partnerId:String, pageNumber:Number):void{
			
			
			 var params:Object = {}; 
				 params["partner"] = partnerId;
				 params["page"] = pageNumber;
				 
			var call : Object = service.send(params);
			call.addResponder( responder );
		}

	}
}