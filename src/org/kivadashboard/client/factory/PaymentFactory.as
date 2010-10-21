package org.kivadashboard.client.factory
{
	import org.kivadashboard.client.model.object.Payment;
	import org.kivadashboard.client.model.object.TermPayment;
	
	public class PaymentFactory
	{
		public function createPayment(result:Object):Payment {
						
		 	var payment:Payment = new Payment();
		 	
		 	payment.amount = result.amount;
		 	payment.comment = result.comment;
		 	payment.localAmount = result.local_amount;
		 	payment.paymentId = result.payment_id;
		 	payment.roundedLocalAmount = result.rounded_amount;
		 	
		 	//Parse out and set processed date
		 	var processedDateString:String = result.processed_date;
		 	var processedDateYear:String = processedDateString.substr(0,4);
		 	var processedDateMonth:String = processedDateString.substr(5,2);
		 	var processedDateDay:String = processedDateString.substr(8,2);
		 	var processedDate:Date = new Date(processedDateYear, processedDateMonth, processedDateDay,0);
		 	processedDate.setMonth(processedDate.getMonth() - 1);
			//trace(" processed date: " + processedDate.toDateString());
			
			 payment.processedDate = processedDate;
			

		 	//Parse out and set settlement date
		 	var settlementDateString:String = result.processed_date;
		 	var settlementDateYear:String = settlementDateString.substr(0,4);
		 	var settlementDateMonth:String = settlementDateString.substr(5,2);
		 	var settlementDateDay:String = settlementDateString.substr(8,2);
		 	var settlementDate:Date = new Date(settlementDateYear, settlementDateMonth, settlementDateDay,0);
		 	settlementDate.setMonth(settlementDate.getMonth() - 1);
		 	//trace(" settlement date: " + settlementDate.toDateString());

		 	payment.settlementDate = settlementDate;

			return payment;
			
		}
		
		
		public function createTermPayment(result:Object):TermPayment {
			
			var termPayment:TermPayment = new TermPayment();
			
			termPayment.amount = result.amount;
			
			var termPaymentDateString:String = result.due_date;
			var termPaymentYear:String =  termPaymentDateString.substr(0,4);
			var termPaymentMonth:String = termPaymentDateString.substr(5,2);
			var termPaymentDay:String = termPaymentDateString.substr(8,2);
			
			termPayment.dueDate = new Date(termPaymentYear, termPaymentMonth,termPaymentDay,0);
			termPayment.dueDate.setMonth(termPayment.dueDate.getMonth() - 1);
			
			return termPayment;
		}

	}
}