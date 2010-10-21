package org.kivadashboard.client.factory
{
	import org.kivadashboard.client.model.object.Location;
	
	public class LocationFactory
	{
		/**
		 * I make locations
		 * 
		 **/
		public function createLocationObject(result:Object):Location{
			
			var location:Location = new Location();
			
			location.country = result.country;
			location.countryCode = result.country_code;
			location.town = result.town;
			
			return location;
		}

	}
}