package org.kivadashboard.client.model.object
{
	public class JournalUser
	{
		public var name:String;
		public var entryCount:Number = 0;
		public var commentCount:Number = 0;
		public var recommendationsCount:Number = 0;
		
		public function incrementEntryCount():void {
			this.entryCount++;
		}
		
		public function addCommentCount(numberOfComments:Number):void{
			this.commentCount += numberOfComments;
		}
		
		public function addRecommendationCount(numberOfRecommendations:Number):void{
			this.recommendationsCount += numberOfRecommendations;
		}
		
		public function addEntryCount(numberOfEntries:Number):void{
			this.entryCount += entryCount;
		}
	}
}