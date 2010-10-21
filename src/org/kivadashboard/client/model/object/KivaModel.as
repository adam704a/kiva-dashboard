package org.kivadashboard.client.model.object
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.kivadashboard.client.event.UpdateGraphDataEvent;
	import org.kivadashboard.client.event.UpdatedLoanDataEvent;
	import org.kivadashboard.client.event.UpdatedPartnerDataEvent;


	[Bindable]
	public class KivaModel extends EventDispatcher
	{
		
		public var _northAmericaLoanCount:String = "0";
		public var _centralAmericaLoanCount:String = "0";
		public var _southAmericaLoanCount:String = "0";
		public var _africaLoanCount:String = "0";
		public var _middleEastLoanCount:String = "0";
		public var _easternEuropeLoanCount:String = "0";
		public var _asiaLoanCount:String = "0";
		
		public var _loans:ArrayCollection;
		public var _partners:ArrayCollection;
		
		// Journals
		public var journalUsers:ArrayCollection = new ArrayCollection();
		public var journalUserNames:ArrayCollection = new ArrayCollection();
		
		private var registeredLoanTotals:Number = 0;

		public function registerLoanTotal():void {
			++registeredLoanTotals;
			if(registeredLoanTotals == 7){
				var event:UpdateGraphDataEvent = new UpdateGraphDataEvent(UpdateGraphDataEvent.EVENT_NAME);
				dispatchEvent(event);
			}
		}
		
		public function set northAmericaLoanCount(loanCount:String):void{
			_northAmericaLoanCount = loanCount;
			registerLoanTotal();
		}
		
		public function get northAmericaLoanCount():String {
			return _northAmericaLoanCount;
		}
		
		public function set centralAmericaLoanCount(loanCount:String):void{
			_centralAmericaLoanCount = loanCount;
			registerLoanTotal();
		}
		
		public function get centralAmericaLoanCount():String {
			return _centralAmericaLoanCount;
		}
		
		public function set southAmericaLoanCount(loanCount:String):void{
			_southAmericaLoanCount = loanCount;
			registerLoanTotal();
		}
		
		public function get southAmericaLoanCount():String {
			return _southAmericaLoanCount;
		}
		
		public function set africaLoanCount(loanCount:String):void{
			_africaLoanCount = loanCount;
			registerLoanTotal();
		}
		
		public function get africaLoanCount():String {
			return _africaLoanCount;
		}
		
		public function set easternEuropeLoanCount(loanCount:String):void{
			_easternEuropeLoanCount = loanCount;
			registerLoanTotal();
		}
		
		public function get easternEuropeLoanCount():String {
			return _easternEuropeLoanCount;
		}
		
		public function set asiaLoanCount(loanCount:String):void{
			_asiaLoanCount = loanCount;
			registerLoanTotal();
		}
		
		public function get asiaLoanCount():String {
			return _asiaLoanCount;
		}
		
		public function set middleEastLoanCount(loanCount:String):void{
			_middleEastLoanCount = loanCount;
			registerLoanTotal();
		}
		
		public function get middleEastLoanCount():String {
			return _middleEastLoanCount;
		}
		
		public function get loans():ArrayCollection {
			return _loans;
		}
		
		public function set loans(loans:ArrayCollection):void{
			this._loans = loans;
			var event:UpdatedLoanDataEvent = new UpdatedLoanDataEvent();
			dispatchEvent(event);
		}
		
		public function set partners(partners:ArrayCollection):void {
			this._partners = partners;
			var event:UpdatedPartnerDataEvent = new UpdatedPartnerDataEvent(UpdatedPartnerDataEvent.EVENT_NAME);
			dispatchEvent(event);
			
		}
		
		public function get partners():ArrayCollection {
			return _partners;
		}
		

		
	}
}