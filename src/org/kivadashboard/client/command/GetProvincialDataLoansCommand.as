package org.kivadashboard.client.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.formatters.DateBase;
	import mx.rpc.IResponder;
	
	import org.kivadashboard.client.business.GetProvincialDataLoanDelegate;
	import org.kivadashboard.client.event.GetProvincialDataLoansEvent;
	import org.kivadashboard.client.factory.ProvincialDataLoanFactory;
	import org.kivadashboard.client.model.object.KivaModel;
	import org.kivadashboard.client.model.object.ProvincialDataLoan;
	import org.kivadashboard.client.model.util.KivaModelLocator;

	public class GetProvincialDataLoansCommand implements IResponder, ICommand
	{

		public var getProvincialDataLoansEvent:GetProvincialDataLoansEvent;

		public function result(data:Object):void
		{
			var provincialDataLoanFactory:ProvincialDataLoanFactory = new ProvincialDataLoanFactory();
			
			if (! data.result.hasOwnProperty("KivaProvincialDataLoans")){
				
				Alert.show("There is a problem with the data.  This probably has to do with the xmlUrl parameter you are using.  " + 
						"To make sure this is valid, try opening this in the browser " + getProvincialDataLoansEvent.xmlUrl);
						
				return;
			}
			
			var provincialLoans:ArrayCollection = provincialDataLoanFactory.createProvincialDataLoans(
					data.result.KivaProvincialDataLoans.KivaProvincialDataLoan as ArrayCollection);
			
			var kivaModel : KivaModel = KivaModelLocator.getInstance();

			kivaModel.loans =  calculateCashFlowForecast(provincialLoans);
				
			
		}
		
		public function fault(info:Object):void
		{
			trace("We have a problem getting the provincial data");
		}
		
		public function execute(event:CairngormEvent):void
		{
			getProvincialDataLoansEvent = GetProvincialDataLoansEvent( event );
			var delegate : GetProvincialDataLoanDelegate = new GetProvincialDataLoanDelegate( this );
			delegate.getProvincialDataLoans(getProvincialDataLoansEvent.xmlUrl);
		}
		
		/**
		 * 
		 * Will return the next twelve months of loan receivables, starting with the current month.
		 * 
		 * categoryDate: the what is displayed on the x axis, one for each month
		 * paymentDate: the dates the payments are to be made.  This is derived
		 * 				from the openDate and methodOfPayment from the ProvincialDataLoan
		 * 
		 * */
		 
		private function calculateCashFlowForecast(provincialDataLoans:ArrayCollection):ArrayCollection {
			
			var monthlyTotals:ArrayCollection = new ArrayCollection();
			
			var categoryDate:Date = new Date();
			
			// Set to the first day of the month so that we don't have problems
			categoryDate.setDate(1);
			
			//Build the Array for 12 months out
			for(var i:int = 0; i < 12; ++i){
				
				// Initialize the monthly payment
				var monthlyPayment:Number = 0;					

				//Go through each loan
				for each(var provincialDataLoan:ProvincialDataLoan in provincialDataLoans){
					
					// Go through the schedule of each loan and figure how many payments will be made in the given month

					for each(var paymentDate:Date in provincialDataLoan.schedule){
						
						if(paymentDate.getMonth() == categoryDate.getMonth() &&
							paymentDate.getFullYear() == categoryDate.getFullYear() ){
							
							trace("Adding " + provincialDataLoan.principlePayment + " from loan " + 
								provincialDataLoan.cid + " to the monthly total for " + 
								DateBase.monthNamesLong[categoryDate.getMonth()] );

							monthlyPayment = monthlyPayment + provincialDataLoan.principlePayment;

						}

					}						

				}

				var obj:Object = new Object();

				obj["Month"] = DateBase.monthNamesLong[categoryDate.getMonth()];
				obj["Payment"] = monthlyPayment;
				monthlyTotals.addItem(obj);
				
				// Advance one month
				categoryDate.setMonth( categoryDate.getMonth() + 1);
				
			}					

			return monthlyTotals;

		}
		
	}
}