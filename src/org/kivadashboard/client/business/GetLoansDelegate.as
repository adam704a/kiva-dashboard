package org.kivadashboard.client.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	public class GetLoansDelegate
	{
		
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function GetLoansDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getHTTPService("loanSearchService");
			this.responder = responder;
		}

		public function getLoansByCountry(regionCode:String):void {
			
			var param:Object = {region:regionCode};
			var call : Object = service.send(param);
			call.addResponder( responder );
		}
		
		public function getLoans(params:Object):void {
			var call : Object = service.send(params);
			call.addResponder( responder );
		}
		
		public function getLoanDetail(params:Object):void {
			var call : Object = service.send(params);
			call.addResponder( responder );
		}

	}
}