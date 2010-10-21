package org.kivadashboard.client.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	import org.kivadashboard.client.business.GetLoansDelegate;
	import org.kivadashboard.client.event.GetNorthAmericaLoanTotalsEvent;
	import org.kivadashboard.client.model.object.KivaModel;
	import org.kivadashboard.client.model.util.KivaModelLocator;

	public class GetMiddleEastLoanTotalsCommand implements ICommand, IResponder
	{

		private static var MIDDLE_EAST_REGION_CODE:String = "me";

		public function execute(event:CairngormEvent):void
		{
			var delegate : GetLoansDelegate = new GetLoansDelegate( this );
			delegate.getLoansByCountry(MIDDLE_EAST_REGION_CODE);
		}
		
		public function result(data:Object):void
		{
			
			var resultEvent:ResultEvent = ResultEvent(data);
			var kivaModel : KivaModel = KivaModelLocator.getInstance();
			kivaModel.middleEastLoanCount =  resultEvent.result.response.paging.total;
			trace("Found " + kivaModel.middleEastLoanCount + " total Middle East Loans");
			
		}
		
		public function fault(info:Object):void
		{
			trace("We have a problem getting the Middle East loan totals");
		}
		
	}
}