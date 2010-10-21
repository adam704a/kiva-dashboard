package org.kivadashboard.client.control
{
	import com.adobe.cairngorm.control.FrontController;
	
	import org.kivadashboard.client.command.GetAfricaLoanTotalsCommand;
	import org.kivadashboard.client.command.GetAsiaLoanTotalsCommand;
	import org.kivadashboard.client.command.GetCentralAmericaLoanTotalsCommand;
	import org.kivadashboard.client.command.GetEastEuropeLoanTotalsCommand;
	import org.kivadashboard.client.command.GetJournalsCommand;
	import org.kivadashboard.client.command.GetLoanDetailCommand;
	import org.kivadashboard.client.command.GetLoansCommand;
	import org.kivadashboard.client.command.GetMiddleEastLoanTotalsCommand;
	import org.kivadashboard.client.command.GetNorthAmericaLoanTotalsCommand;
	import org.kivadashboard.client.command.GetPartnersCommand;
	import org.kivadashboard.client.command.GetProvincialDataLoansCommand;
	import org.kivadashboard.client.command.GetSouthAmericaLoanTotalsCommand;
	import org.kivadashboard.client.event.GetAfricaLoanTotalsEvent;
	import org.kivadashboard.client.event.GetAsiaLoanTotalsEvent;
	import org.kivadashboard.client.event.GetCentralAmericaLoanTotalsEvent;
	import org.kivadashboard.client.event.GetEasternEuropeanLoanTotalsEvent;
	import org.kivadashboard.client.event.GetJournalsEvent;
	import org.kivadashboard.client.event.GetLoanDetailEvent;
	import org.kivadashboard.client.event.GetLoansEvent;
	import org.kivadashboard.client.event.GetMiddleEastLoanTotalsEvent;
	import org.kivadashboard.client.event.GetNorthAmericaLoanTotalsEvent;
	import org.kivadashboard.client.event.GetPartnersEvent;
	import org.kivadashboard.client.event.GetProvincialDataLoansEvent;
	import org.kivadashboard.client.event.GetSouthAmericaLoanTotalsEvent;

	public class KivaController extends FrontController
	{
		public function KivaController()
		{
			initializeCommands();
		}
	
		public function initializeCommands():void{
			
			addCommand(GetNorthAmericaLoanTotalsEvent.EVENT_NAME,  GetNorthAmericaLoanTotalsCommand);
			addCommand(GetSouthAmericaLoanTotalsEvent.EVENT_NAME,  GetSouthAmericaLoanTotalsCommand);
			addCommand(GetCentralAmericaLoanTotalsEvent.EVENT_NAME,  GetCentralAmericaLoanTotalsCommand);
			addCommand(GetAfricaLoanTotalsEvent.EVENT_NAME,  GetAfricaLoanTotalsCommand);
			addCommand(GetEasternEuropeanLoanTotalsEvent.EVENT_NAME,  GetEastEuropeLoanTotalsCommand);
			addCommand(GetAsiaLoanTotalsEvent.EVENT_NAME,  GetAsiaLoanTotalsCommand);
			addCommand(GetMiddleEastLoanTotalsEvent.EVENT_NAME,  GetMiddleEastLoanTotalsCommand);
			addCommand(GetLoansEvent.EVENT_NAME,  GetLoansCommand);
			addCommand(GetProvincialDataLoansEvent.EVENT_NAME,  GetProvincialDataLoansCommand);
			addCommand(GetLoanDetailEvent.EVENT_NAME,  GetLoanDetailCommand);
			addCommand(GetPartnersEvent.EVENT_NAME, GetPartnersCommand);
			addCommand(GetJournalsEvent.EVENT_NAME, GetJournalsCommand);
		}
		
	}
}