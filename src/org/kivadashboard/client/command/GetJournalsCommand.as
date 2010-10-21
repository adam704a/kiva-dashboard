package org.kivadashboard.client.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import flash.events.EventDispatcher;
	
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.rpc.IResponder;
	
	import org.kivadashboard.client.business.GetJournalsDelegate;
	import org.kivadashboard.client.event.GetJournalsEvent;
	import org.kivadashboard.client.event.StopEverythingEvent;
	import org.kivadashboard.client.event.UpdatedJournalPageEvent;
	import org.kivadashboard.client.event.UpdatedJournalUsersEvent;
	import org.kivadashboard.client.factory.JournalFactory;
	import org.kivadashboard.client.model.object.JournalEntry;
	import org.kivadashboard.client.model.object.JournalUser;
	import org.kivadashboard.client.model.object.KivaModel;
	import org.kivadashboard.client.model.util.KivaModelLocator;

	public class GetJournalsCommand extends EventDispatcher implements ICommand, IResponder
	{
		
		public var getJournalsEvent:GetJournalsEvent;

		public function execute(event:CairngormEvent):void
		{
			
			getJournalsEvent = GetJournalsEvent(event);
	
			var delegate : GetJournalsDelegate = new GetJournalsDelegate( this );
			delegate.getJournals(getJournalsEvent.partnerId, getJournalsEvent.pageNumber);
		}
		
		public function result(data:Object):void
		{
			
			var journalFactory:JournalFactory = new JournalFactory();
			var kivaModel : KivaModel = KivaModelLocator.getInstance();
			
			// fire off event  to update progress bar
			var updatedJournalPageEvent:UpdatedJournalPageEvent = new UpdatedJournalPageEvent(data.result.response.paging.page, data.result.response.paging.pages)
			FlexGlobals.topLevelApplication.dispatchEvent(updatedJournalPageEvent );
					
			//Account for some data problems
			if(data.result.response.journal_entries == null){
				var stopEverythingEvent:StopEverythingEvent = new StopEverythingEvent("No Journal Entries Error");
				FlexGlobals.topLevelApplication.dispatchEvent(stopEverythingEvent);
				return;
			}
					
			for(var i:Number = 0; i < data.result.response.journal_entries.journal_entry.length ; ++i){
				 
				 var journalEntry:JournalEntry = journalFactory.createJournal(data.result.response.journal_entries.journal_entry[i]);
				 var journalUser:JournalUser;
				 
				 //If the author hasn't been added already then add
				 if( kivaModel.journalUserNames.contains(journalEntry.author) ){
				 	
				 	// Get the index
				 	var index:int = kivaModel.journalUserNames.getItemIndex(journalEntry.author);
				 	journalUser = kivaModel.journalUsers[index];
				 	
				 	// Increment the entry count
				 	journalUser.incrementEntryCount();
				 	
				 	// Increment the recommendation count, if necessary
				 	if(journalEntry.recommendation_count > 0 ){
				 		journalUser.addRecommendationCount(journalEntry.recommendation_count);
				 	}
				 	
				 	// Increment the comment count, if necessary
				 	if(journalEntry.comment_count > 0 ){
				 		journalUser.addCommentCount(journalEntry.comment_count);
				 	}
				 
				 }else{
				 	journalUser = new JournalUser();
				 	journalUser.name = journalEntry.author;

				 	journalUser.commentCount = journalEntry.comment_count;
				 	journalUser.recommendationsCount = journalEntry.recommendation_count;
				 	journalUser.entryCount = 1;
				 	
				 	//Add this to the model
				 	kivaModel.journalUsers.addItem(journalUser);				 	
				 	kivaModel.journalUserNames.addItem(journalEntry.author);
				 }
			
			}
			
			// Fire an event off when everything is updated
			if(data.result.response.paging.pages == data.result.response.paging.page ){
				trace("We got all of the unique journalers now, there were " + kivaModel.journalUsers.length + " in all");
				var updatedJournalUsersEvent:UpdatedJournalUsersEvent = new UpdatedJournalUsersEvent();
				FlexGlobals.topLevelApplication.dispatchEvent( updatedJournalUsersEvent);
			}
			
			
			// Get the rest of the pages
			if(data.result.response.paging.pages > data.result.response.paging.page ){
				
				trace("Getting page " + data.result.response.paging.page );
				var getJournalsEvent:GetJournalsEvent = new GetJournalsEvent(getJournalsEvent.partnerId, data.result.response.paging.page + 1 );
				getJournalsEvent.dispatch();
				
			}
			
		}
		
		public function fault(info:Object):void
		{
			var errorMessage:String = "We ran into a problem getting journals: " + info.fault.faultString;
			trace(errorMessage);
			
			var stopEverythingEvent:StopEverythingEvent = new StopEverythingEvent(info.fault.faultString);
			FlexGlobals.topLevelApplication.dispatchEvent(stopEverythingEvent);
		}
		
	}
}