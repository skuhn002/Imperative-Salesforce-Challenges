@isTest
public with sharing class ScheduledOpportunity_Test {


    @TestSetup
    static void makeData(){
        Opportunity o1 = new Opportunity(
            Name = 'Opportunity ',
            CloseDate = Date.today(),
            StageName = 'Prospecting'
        );
        insert o1;

        Opportunity o2 = new Opportunity(
            Name = 'Opportunity ',
            CloseDate = Date.today(),
            StageName = 'Closed Won'
        );

        Datetime tooOld = Datetime.now().addMonths(-6);
        insert o2;
        Test.setCreatedDate(o2.Id, tooOld);
    }







    @isTest
    public static void deleteOldOpps(){
        List<Opportunity> oppsBefore = [SELECT createdDate, stageName FROM Opportunity];
        System.assertEquals(2, oppsBefore.size());

        ScheduledOpportunity apexClass = new ScheduledOpportunity();
        String scheduleWhen = '0 0 0 5 11 ? 2023';
        
        Test.startTest();
        // String jobId = System.execute('Apex Test Delete Opportunities', scheduleWhen, apexClass);
        Test.stopTest();
    }
}