@isTest

private class AccountProcessorTest {
    @isTest
    private static void testAccountProcessor(){
        Account acct = new Account();
                acct.Name = 'Test Account';
                insert acct;

        Contact con = new Contact();
          con.FirstName = 'Bob';
          con.LastName = 'Johnson';
          con.AccountId = acct.Id;
        Insert con;

        List<Id> acctLst = new List<Id>();
        acctLst.add(acct.id);

        Test.startTest();
            AccountProcessor.countContacts(acctLst);
        Test.stopTest();

        Account acc = [select Number_of_Contacts__c from Account where id = :acct.id LIMIT 1];
        System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c), 1);
    }
}