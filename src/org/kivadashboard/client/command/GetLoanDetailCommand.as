package org.kivadashboard.client.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;
	
	import org.kivadashboard.client.business.GetLoanDetailDelegate;
	import org.kivadashboard.client.event.GetLoanDetailEvent;
	import org.kivadashboard.client.factory.LoanFactory;
	import org.kivadashboard.client.model.object.KivaModel;
	import org.kivadashboard.client.model.object.Loan;
	import org.kivadashboard.client.model.util.KivaModelLocator;
	
	public class GetLoanDetailCommand implements ICommand, IResponder
	{
		private var kivaLoanDetailsEvent:GetLoanDetailEvent;
		
		public function execute(event:CairngormEvent):void
		{
			kivaLoanDetailsEvent = GetLoanDetailEvent(event)
			
			trace("Getting loan details for loan id: "+ kivaLoanDetailsEvent.kivaLoanId);
			var delegate : GetLoanDetailDelegate = new GetLoanDetailDelegate( this );
			delegate.getLoanDetail(kivaLoanDetailsEvent.kivaLoanId);
			
		}
		
		public function result(data:Object):void
		{
			
			trace("We have some details for loan id " + kivaLoanDetailsEvent.kivaLoanId + ". Handling the result");
			
			var resultEvent:ResultEvent = ResultEvent(data);
			var kivaModel : KivaModel = KivaModelLocator.getInstance();
			
			var loanFactory:LoanFactory = new LoanFactory();
			var loan:Loan = loanFactory.createLoanObject(data.result.response.loans.loan);
			
			//Have to do this because the model requires it..dont' argue.
			var loans:ArrayCollection = new ArrayCollection();
			loans.addItem(loan);
			
			kivaModel.loans = loans;
		}
		
		
		public function fault(info:Object):void
		{
			var errorMessage:String = "This id can't be found or there's a problem with the API. One of the two.";
			trace("We have a problem getting the loan details for loan id: " + kivaLoanDetailsEvent.kivaLoanId);
			FlexGlobals.topLevelApplication.errorText.text = errorMessage;
		}

	}
}