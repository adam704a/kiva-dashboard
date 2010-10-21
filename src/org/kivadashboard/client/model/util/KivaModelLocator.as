package org.kivadashboard.client.model.util
{
	import com.adobe.cairngorm.model.ModelLocator;
	
	import org.kivadashboard.client.model.object.KivaModel;

	public class KivaModelLocator implements ModelLocator
	{
	
		private static var model:KivaModel;
		
		public static function getInstance():KivaModel {
			
			if(model == null){
				model = new KivaModel();
			}
			
			return model;
		}
			
		

	}
}