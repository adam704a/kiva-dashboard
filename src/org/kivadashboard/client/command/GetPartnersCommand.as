package org.kivadashboard.client.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.rpc.IResponder;
	
	import org.kivadashboard.client.business.GetPartnersDelegate;
	import org.kivadashboard.client.event.UpdatedPartnerDataEvent;
	import org.kivadashboard.client.factory.PartnerFactory;
	import org.kivadashboard.client.model.object.KivaModel;
	import org.kivadashboard.client.model.object.Partner;
	import org.kivadashboard.client.model.util.KivaModelLocator;

	public class GetPartnersCommand implements ICommand, IResponder
	{

		public function execute(event:CairngormEvent):void
		{
			
			var delegate : GetPartnersDelegate = new GetPartnersDelegate( this );
			delegate.getPartners(1);
		}
		
		public function result(data:Object):void
		{
			trace("Handling the result from the GetPartnersCommand");
			
			var partners:ArrayCollection = new ArrayCollection();
			
			var partnerFactory:PartnerFactory = new PartnerFactory();
			
			for(var i:Number = 0; i < data.result.response.partners.partner.length ; ++i){
				 var partner:Partner = partnerFactory.createPartner(data.result.response.partners.partner[i]);
				 partners.addItem(partner);
			}

			var kivaModel : KivaModel = KivaModelLocator.getInstance();
			kivaModel.partners = partners;
			
		}
		
		public function fault(info:Object):void
		{
			var errorMessage:String = "This id can't be found or there's a problem with the API. One of the two.";
			trace(errorMessage);
			
		}
		
	}
}