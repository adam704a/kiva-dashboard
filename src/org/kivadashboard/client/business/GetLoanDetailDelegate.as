package org.kivadashboard.client.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	public class GetLoanDetailDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		private var urlPrefix:String = "http://api.kivaws.org/v1/loans/";
		private var urlPostfix:String = ".xml?app_id=org.kivadashboard.loandetail";
		
		public function GetLoanDetailDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getHTTPService("loanDetailService");
			this.responder = responder;
		}
		
		public function getLoanDetail(loanId:String):void{

			//Build the Service URL
			service.url = urlPrefix + loanId + urlPostfix;
			trace(service.url);
		
			var call : Object = service.send();
			call.addResponder( responder );
		}

	}
}