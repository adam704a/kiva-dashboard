package org.kivadashboard.client.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	import org.kivadashboard.client.business.GetLoansDelegate;
	import org.kivadashboard.client.event.GetLoansEvent;
	import org.kivadashboard.client.factory.LoanFactory;
	import org.kivadashboard.client.model.object.KivaModel;
	import org.kivadashboard.client.model.util.KivaModelLocator;

	public class GetLoansCommand implements ICommand, IResponder
	{
		
		public var getLoansEvent:GetLoansEvent;

		public function execute(event:CairngormEvent):void
		{
			
			getLoansEvent = GetLoansEvent( event );
			var delegate : GetLoansDelegate = new GetLoansDelegate( this );
			
			delegate.getLoans(getLoansEvent.parameters);
			
		}
		
		public function result(data:Object):void
		{
				trace("We have something from the loan search. Handling the result");
				
				var resultEvent:ResultEvent = ResultEvent(data);
				var kivaModel : KivaModel = KivaModelLocator.getInstance();
				
				// If the data page doesn't exist then there are no results
				if (! data.hasOwnProperty("page")){
				
					Alert.show("Sorry, I couldn't find anything.  This probably means that your Kiva Partner doesn't have" + 
							" any loans that meet your criteria");
					return;
				}
				getLoansEvent.parameters["page"] = data.page.size + 1; 
				
				if(data.page.size > 1){
					var getLoansEvent:GetLoansEvent = new GetLoansEvent(getLoansEvent.parameters);
					getLoansEvent.dispatch();	
				
				}
			
				var loanFactory:LoanFactory = new LoanFactory();
				kivaModel.loans = loanFactory.createLoanObjects(data.result.response.loans.loan);
				
				
		}
		
		public function fault(info:Object):void
		{
			trace("We have a problem using the loan search");
		}
		
	}
}