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
        // Test.setCreatedDate(o2, tooOld);
        insert o2;
    }

    @isTest
    public static void deleteOldOpps(){
        ScheduledOpportunity apexClass = new ScheduledOpportunity(); 
        
        // System.execute('Apex Test Delete Opportunities', scheduleWhen, apexClass);
    }
}