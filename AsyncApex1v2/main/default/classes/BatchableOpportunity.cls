public with sharing class BatchableOpportunity implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('SELECT Id, createdDate, isClosed, lastModifiedDate FROM Opportunity WHERE isClosed = false AND lastModifiedDate < LAST_N_MONTHS:6');
    }

    public void execute(Database.BatchableContext BC, List<SObject> opps){
        List<Opportunity> deleteOpps = new List<Opportunity>();

        for(sObject o : opps){
            deleteOpps.add((Opportunity) o);
        }
        Database.delete(deleteOpps, false);
    }

    public void finish(Database.BatchableContext BC){
    }
}