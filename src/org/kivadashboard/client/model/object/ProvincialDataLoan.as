package org.kivadashboard.client.model.object

{

	import mx.collections.ArrayCollection;
	
	public class ProvincialDataLoan

	{
		public function ProvincialDataLoan()
		{
		}

		public var cid:String;
		public var account:String;
		public var firstName:String;
		public var lastName:String;
		public var gender:String;
		public var loanAmount:String;
		public var openDate:Date;
		public var matureDate:Date;
		public var modeOfPayment:String;
		public var principlePayment:Number;
		public var principlePaid:Number;
		public var loanOfficer:String;
	
		public var schedule:ArrayCollection = new ArrayCollection();

	}

}