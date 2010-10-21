package org.kivadashboard.client.factory
{
	import mx.collections.ArrayCollection;
	
	import org.kivadashboard.client.model.object.Loan;
	import org.kivadashboard.client.model.object.Payment;
	import org.kivadashboard.client.model.object.TermPayment;
	
	public class LoanFactory
	{
		
		/**
		 * Create Loan Objects
		 * 
		 **/
		public function createLoanObjects(result:ArrayCollection):ArrayCollection {
			
			 var loans:ArrayCollection = new ArrayCollection();
			
			for(var i:Number = 0; i < result.length ; ++i){
				 var loan:Loan = createLoanObject(result[i]);
				 loans.addItem(loan);
			}
			
			return loans;
		}
		
		
		/**
		 * Create Loan Object
		 * 
		 **/
		public function createLoanObject(result:Object):Loan {
			
			var loan:Loan = new Loan();
			loan.loanId = result.id;
			loan.name = result.name;
			
			loan.fundedAmount = result.funded_amount;
			loan.activity = result.activity;
			
			var locationFactory:LocationFactory = new LocationFactory();
			loan.location =  locationFactory.createLocationObject(result.location);
			
			var paymentFactory:PaymentFactory = new PaymentFactory();
			
			
			if ( result.hasOwnProperty("payments")){
				
			  	
				
				if( result.payments.payment is ArrayCollection ){
					
					//If there are more than two payments an ArrayCollection is returned (this is a flex thing)
					for each (var paymentResult:Object in result.payments.payment){
					 	var payment:Payment = paymentFactory.createPayment(paymentResult);
					 	loan.payments.addItem(payment);
					}
					
				}
				else{
					var singlePayment:Payment = paymentFactory.createPayment(result.payments.payment);
					loan.payments.addItem(singlePayment);
				}
				
			}
			
			
			
			if (!result.hasOwnProperty("terms")){
				
				loan.loanAmount = result.terms.loan_amount;
				loan.disbursalAmount = result.terms.disbursal_amount;
				loan.disbusalCurrency = result.terms.disbursal_currency;
			}
			
			//Account for some data problems
			if( result.terms.hasOwnProperty("scheduled_payments")){
				
				if(  result.terms.scheduled_payments.scheduled_payment is ArrayCollection){
					
					for each (var scheduledPaymentResult:Object in result.terms.scheduled_payments.scheduled_payment){
					 	var scheduledPayment:TermPayment = paymentFactory.createTermPayment(scheduledPaymentResult);
					 	loan.scheduledPayments.addItem(scheduledPayment);
					}
				}
				else{
					var singleScheduledPayment:TermPayment = paymentFactory.createTermPayment(result.terms.scheduled_payments.scheduled_payment);
					loan.scheduledPayments.addItem(singleScheduledPayment);
				}
			}
			
		
			if( result.terms.hasOwnProperty("local_payments")){
				
				if( result.terms.local_payments.local_payment is ArrayCollection ){
					
					for each (var localPaymentResult:Object in result.terms.local_payments.local_payment){
					 	var localPayment:TermPayment = paymentFactory.createTermPayment(localPaymentResult);
					 	loan.localPayments.addItem(localPayment);
					}
				}
				else{
					var singleLocalPayment:TermPayment = paymentFactory.createTermPayment(result.terms.local_payments.local_payment);
					loan.localPayments.addItem(singleLocalPayment);
					
				}
				
			}
			
			return loan;
		}

	}
}