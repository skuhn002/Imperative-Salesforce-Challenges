public with sharing class AuraAccountsController {
    @AuraEnabled
    public static List<Account> getAccounts(){
        try {
            return [SELECT name, industry, annualRevenue FROM Account];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}