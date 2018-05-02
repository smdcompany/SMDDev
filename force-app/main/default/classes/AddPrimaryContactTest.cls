@isTest
private class AddPrimaryContactTest {
    @isTest
    static void testQueueable(){
        List<Account> accounts = new List<Account>();
        for (Integer i=0; i<50; i++){
            accounts.add(new Account(BillingState = 'CA', Name = 'Test Account'+i));
        }

        for(Integer j=0; j<50; j++){
            accounts.add(new Account(BillingState = 'NY', Name = 'Test Account'+j));
        }
        insert accounts;
        System.debug(accounts);

        Contact con = new Contact();
        con.LastName = 'demo';
        insert con;
        String state = 'CA';

        AddPrimaryContact apc = new AddPrimaryContact(con,state);

        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();

        System.assertEquals(50, [select count() from Contact Where AccountId IN (Select Id From Account Where BillingState = :state)]);
    }
}