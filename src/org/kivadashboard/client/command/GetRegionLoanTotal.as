package org.kivadashboard.client.command
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cairngorm.business.Responder;
	import com.adobe.cairngorm.commands.ICommand;

	public class GetRegionLoanTotal implements ICommand, Responder
	{
		public function GetRegionLoanTotal()
		{
		}

		public function execute(event:CairngormEvent):void
		{
		}
		
		public function onResult(event:Object=null):void
		{
		}
		
		public function onFault(event:Object=null):void
		{
		}
		
	}
}