package org.kivadashboard.client.model.object
{
	import mx.collections.ArrayCollection;
	
	public class Partner
	{

		public var id:Number;
		public var name:String;
		public var status:String;
		public var rating:String;
		public var start_date:Date;
		public var delinquency_rate:Number;
		public var default_rate:Number;
		public var total_amount_raised:Number;
		public var loans_posted:Number;
		
		public var countries:ArrayCollection = new ArrayCollection();
		
	}
}