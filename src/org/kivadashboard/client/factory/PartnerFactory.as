package org.kivadashboard.client.factory
{
	import mx.collections.ArrayCollection;
	
	import org.kivadashboard.client.model.object.Country;
	import org.kivadashboard.client.model.object.Partner;
	
	public class PartnerFactory
	{

		public function createPartner(result:Object):Partner {
			
			var partner:Partner = new Partner();
			partner.name = result.name;
			partner.id = result.id;
			partner.rating = result.rating;
			partner.default_rate = result.default_rate;
			partner.delinquency_rate = result.delinquency_rate;
			partner.loans_posted = result.loans_posted;
			partner.total_amount_raised = result.total_amount_raised;
			
			partner.status = result.status;
			
			//Parse out and set processed date
		 	var startDateString:String = result.start_date;
		 	var startDateYear:String = startDateString.substr(0,4);
		 	var startDateMonth:String = startDateString.substr(5,2);
		 	var startDateDay:String = startDateString.substr(8,2);
		 	var startDate:Date = new Date(startDateYear, startDateMonth, startDateDay,0);
		 	var country:Country;
		 	
		 	partner.start_date = startDate;
		 	
		 	if(result.countries.country is ArrayCollection){
		 		
		 		for each (var countryResult:Object in result.countries.country){
					 country= new Country();
					 country.name = countryResult.name;
					 country.region = countryResult.region;
					 partner.countries.addItem(country); 
					 
					
				}
		 	}
		 	else{
		 		country = new Country();
		 		country.name = result.countries.country.name;
		 		country.region = result.countries.country.region;
		 		partner.countries.addItem(country);
		 	}
			
			return partner;
		}

	}
}