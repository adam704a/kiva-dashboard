package util
{
	import mx.formatters.DateFormatter;

	public class KivaDateFormatter extends DateFormatter
	{
		public function KivaDateFormatter()
		{
			super();
		}
		
		/**
		 * 
		 * Uses this format DD/MM/YYYY
		 * 
		 * This method exists in the DateFormatter class, but its protected
		 * and I can't figure out how to use it for now.
		 * 
		 * */
		public static function parseDateString(string):Date {
			var date:Number = Date.parse("11/26/2009");
			
		}
	}
}