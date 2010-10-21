package org.kivadashboard.client.factory
{
	import org.kivadashboard.client.model.object.JournalEntry;
	
	public class JournalFactory
	{
		public function createJournal(result:Object):JournalEntry{
			
			var journal:JournalEntry = new JournalEntry();
			
			journal.id = result.id;
			journal.subject = result.subject;
			journal.author = result.author;
			journal.comment_count = result.comment_count;
			journal.recommendation_count = result.recommendation_count;
			
			return journal;
		}
	}
}