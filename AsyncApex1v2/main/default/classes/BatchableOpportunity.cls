public with sharing class BatchableOpportunity implements Database.Batchable<Opportunity> {
    public List<Opportunity> start(Database.BatchableContext BC){
        return [SELECT Id, createdDate FROM Opportunity WHERE NOT stageName LIKE 'Closed%'];
    }

    public void execute(Database.BatchableContext BC, List<Opportunity> opps){
        List<Opportunity> deleteOpps = new List<Opportunity>();
        Date nowDate = Date.today();

        for(Opportunity o : opps){
            if(o.createdDate.date().monthsBetween(nowDate) >= 6){
                deleteOpps.add(o);
            }
        }
        Database.delete(deleteOpps, false);
    }

    public void finish(Database.BatchableContext BC){
    }
}