package org.kivadashboard.client.business
{
	
	import com.adobe.cairngorm.business.ServiceLocator;
	
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	
	public class GetPartnersDelegate
	{
		private var responder : IResponder;
		private var service : HTTPService;
		
		public function GetPartnersDelegate(responder:IResponder)
		{
			this.service = ServiceLocator.getInstance().getHTTPService("partnerService");
			this.responder = responder;
		}
		
		public function getPartners(pageNumber:Number):void {
			
			var param:Object = {page:pageNumber};
			var call : Object = service.send(param);
			call.addResponder( responder );
		}
		
		
	}
}