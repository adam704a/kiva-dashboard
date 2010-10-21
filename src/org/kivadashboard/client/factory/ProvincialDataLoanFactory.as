package org.kivadashboard.client.factory
{
	import mx.collections.ArrayCollection;
	
	import org.kivadashboard.client.model.object.ProvincialDataLoan;
	
	public class ProvincialDataLoanFactory
	{

		/**
		 * 
		 * Basically maps the incoming xml data to the model.  Also, an 
		 * array of payment dates is also maintained.
		 * 
		 * */
		public function createProvincialDataLoans(loanData:ArrayCollection): ArrayCollection {

			 var loans:ArrayCollection = new ArrayCollection();

			for each (var xmlLoan:Object in loanData)

			{
				
				// Put everything in to a Provincial Data Loan Object
				var provincialDataLoan:ProvincialDataLoan = new ProvincialDataLoan();

				provincialDataLoan.cid = xmlLoan.cid;
				provincialDataLoan.account = xmlLoan.account;
				provincialDataLoan.firstName = xmlLoan.firstName;
				provincialDataLoan.lastName = xmlLoan.lastName;
				provincialDataLoan.gender = xmlLoan.gender;
				provincialDataLoan.loanAmount = xmlLoan.loanAmount;
				provincialDataLoan.principlePaid = xmlLoan.principlePaid;
				provincialDataLoan.principlePayment = xmlLoan.principlePayment;
				provincialDataLoan.loanOfficer = xmlLoan.loanOfficer;
				provincialDataLoan.modeOfPayment = xmlLoan.modeOfPayment;


				// This seems like a terrible way to do this, but 
				// this is what we have for now.

				var openDateMilliSeconds:Number = Date.parse(xmlLoan.openDate);

				provincialDataLoan.openDate = new Date(openDateMilliSeconds);


				var matureDateMilliSeconds:Number = Date.parse(xmlLoan.matureDate);
				provincialDataLoan.matureDate = new Date(matureDateMilliSeconds);
				var paymentDate:Date;

				

				// Figure out how many weeks in the schedule
				var loanDurationInMilliseconds:Number = provincialDataLoan.matureDate.time - provincialDataLoan.openDate.time;
				
				if( xmlLoan.modeOfPayment == "WEEKLY"){
					
					var numberOfWeeks:Number = Math.round(loanDurationInMilliseconds / (1000 * 60 * 60 * 24 * 7));
					
					// set the schedule
					for(var i:int = 1 ; i <= int(numberOfWeeks) ; ++i){
						paymentDate = new Date(openDateMilliSeconds + (1000 * 60 * 60 * 24 * 7 * i)  );
						provincialDataLoan.schedule.addItem(paymentDate);

					}
					

				}
				
				//Sometimes people pay monthly
				else if( xmlLoan.modeOfPayment == "MONTHLY"){
					
					var numberOfMonths:Number;							

					// If the years are the same, then the number of months is just the difference
					// between the matureDate and the openDate.  When the years are not the same
					// then it is the differnece between the matureDate and openDate  and added to
					// the product of 12 and the diffference in years. 
					

					if( provincialDataLoan.matureDate.fullYear == provincialDataLoan.openDate.fullYear){
						numberOfMonths = provincialDataLoan.matureDate.month - provincialDataLoan.openDate.month;
					}
					
					else{
						numberOfMonths = (provincialDataLoan.matureDate.month - provincialDataLoan.openDate.month) + 
						(12 * ( provincialDataLoan.matureDate.fullYear - provincialDataLoan.openDate.fullYear));
					}
				
					// set the schedule
					for(var j:int = 1 ; j <= int(numberOfMonths) ; ++j){
						paymentDate = new Date(openDateMilliSeconds);
						paymentDate.setMonth( paymentDate.getMonth() + j);
						provincialDataLoan.schedule.addItem(paymentDate);
					}					
				

				}
				
				// Lumpsums are another option
				else if(xmlLoan.modeOfPayment == "LUMPSUM"){						
					paymentDate = new Date(matureDateMilliSeconds);
					provincialDataLoan.schedule.addItem(paymentDate);
				}					

				loans.addItem(provincialDataLoan);

			}				

			return loans;

		}

	}
}