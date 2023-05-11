public class ScheduledOpportunity implements Schedulable {
    public void execute(SchedulableContext sc){
        BatchableOpportunity batchClass = new BatchableOpportunity();
        Id jobId = Database.executeBatch(batchClass);
    }
}