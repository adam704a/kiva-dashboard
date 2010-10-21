package org.kivadashboard.client.model.object
{
	import mx.collections.ArrayCollection;
	
	public class Loan
	{
		public var loanId:String;
		public var name:String;
		public var activity:String;
		public var fundedAmount:Number;
		public var loanAmount:Number;
		public var _amountNeeded:String;
		public var location:Location;
		public var _url:String;
		public var disbursalAmount:Number;
		public var disbusalCurrency:String;
		
		// Payments are "received" payemnts
		public var payments:ArrayCollection = new ArrayCollection();
		
		//The payment schedule represented in the local currency
		public var localPayments:ArrayCollection = new ArrayCollection();
		
		//The payment schedule represented in USD
		public var scheduledPayments:ArrayCollection = new ArrayCollection();
		
		private static var URL_PREFIX:String = "http://www.kiva.org/app.php?page=businesses&action=about&id=";
		
		public function get url():String{
			return URL_PREFIX + loanId;
		}
		
	   public function get amountNeeded():String{
			
			// Convert Numbers
			var calcAmount:Number = loanAmount -fundedAmount;
			return calcAmount.toString();
		}
		
		
		public function get lastLocalPayment():TermPayment {
			
			//Default the payment to the first one in the list
			var lastLocalPayment:TermPayment = localPayments.getItemAt(0) as TermPayment;
			
			// GO through this list and return the latest one (we will not rely on the order for now.
			for each(var locaPaymentResult:TermPayment in localPayments){
				
				if (locaPaymentResult.dueDate.time > lastLocalPayment.dueDate.time){
					lastLocalPayment = locaPaymentResult;
				}
			}
			
			return lastLocalPayment;
		}
		
		public function get totalActualReported():Number{
			
			// Add up all of the local payments
			var totalActualReported:Number = 0;
			for each (var localPaymentResult:TermPayment in localPayments){
				totalActualReported = totalActualReported + localPaymentResult.amount;
			}
			
			return totalActualReported;
		}
		
		/**
		 * 
		 * Returns the last payment from the schedule
		 * 
		 **/
		public function get lastScheduledPayment():TermPayment {
			
			//Default the payment to the first one in the list
			var lastScheduledPayment:TermPayment = scheduledPayments.getItemAt(0) as TermPayment;
			
			// Go through this list and return the latest one (we will not rely on the order for now.
			for each (var scheduledPaymentResult:TermPayment in scheduledPayments){
				
				if( scheduledPaymentResult.dueDate.time > lastScheduledPayment.dueDate.time){
					lastScheduledPayment = scheduledPaymentResult;
				}
			 				
			}
			
			return lastScheduledPayment;
			
		}
		
		public function get lastExpectedPayment():TermPayment {
			
			//Default the payment to the first one in the list
			var lastExpectedPayment:TermPayment = localPayments.getItemAt(0) as TermPayment;
			
			//Go thorugh this list and return the lateset one (we will not rely on the order for now).
			for each (var expectedPaymentResult:TermPayment in localPayments){
				
				if( expectedPaymentResult.dueDate.time > lastExpectedPayment.dueDate.time){
					lastExpectedPayment = expectedPaymentResult;
				}
			}
			
			return lastExpectedPayment;
		}
		
		/**
		 * 
		 * Returns the last payment that was made
		 * 
		 **/
		public function get lastReportedPayment():Payment {
			
			//Default the payment to the first one in the list
			var lastReportedPayment:Payment = payments.getItemAt(0) as Payment;
			
			//Go through the list and return the latest one (we will not rely on the order for now.
			for each(var paymentResult:Payment in payments){
				
				//Using processed not, not sure if thats right
				if(paymentResult.processedDate.time > lastReportedPayment.processedDate.time){
					lastReportedPayment = paymentResult;
				}
			}
			
			return lastReportedPayment;
		}
		
		/**
		 * 
		 * Compares the sum of the payments made with the loan.terms.loan_amount
		 * 
		 **/
		public function get isLoanFullyPaidBack():Boolean {
			
			var amountPaidPaySoFar:Number = 0;
			
			//Adds up all of the payments made
			for each(var paymentResult:Payment in payments){
				amountPaidPaySoFar += paymentResult.amount;
			}
			
			trace("Amount Paid Back So Far: " + amountPaidPaySoFar);
			trace("Loan Amount: " + loanAmount);
			
			if(amountPaidPaySoFar == loanAmount){
				return true;
			}
			else{
				return false;
			}
			
		}
		
	}
	
}