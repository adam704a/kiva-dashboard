package org.kivadashboard.client.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
		
	public class GetProvincialDataLoanDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function GetProvincialDataLoanDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getHTTPService("provincialDataLoanService");
			this.responder = responder;
		}
		
		public function getProvincialDataLoans(xmlUrl:String):void{
			
			var params:Object = {}; 
			params["app_id"] = "org.kivadashboard.kivacashflowforcaster";
			
			service.url = xmlUrl;
			var call : Object = service.send(params);
			call.addResponder( responder );
		}

	}
}