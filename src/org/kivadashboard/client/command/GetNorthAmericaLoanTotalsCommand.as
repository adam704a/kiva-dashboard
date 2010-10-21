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

	public class GetNorthAmericaLoanTotalsCommand implements ICommand, IResponder
	{

		private static var NORTH_AMERICA_REGION_CODE:String = "na";
		
		public function execute(event:CairngormEvent):void
		{
			var delegate : GetLoansDelegate = new GetLoansDelegate( this );
			delegate.getLoansByCountry(NORTH_AMERICA_REGION_CODE);
		}
		
		public function result(data:Object):void
		{
			
			var resultEvent:ResultEvent = ResultEvent(data);
			var kivaModel : KivaModel = KivaModelLocator.getInstance();
			kivaModel.northAmericaLoanCount =  resultEvent.result.response.paging.total;
			trace("Found " + kivaModel.northAmericaLoanCount + " total North America Loans");
			
		}
		
		public function fault(info:Object):void
		{
			trace("We have a problem getting the North America loan totals");
		}
		
	}
}