@isTest
private class AccountManagerTest {
    @isTest
    static void testGetAccountById(){
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI  = 'https://smddev-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAccount = AccountManager.getAccount();

        System.assert(thisAccount != null);
        System.assertEquals('Test record', thisAccount.Name);
    }
    //helper method
    static Id createTestRecord(){
        Account acct = new Account(
                Name = 'Test record'
        );
        insert acct;
        Contact con = new Contact(
                FirstName = 'Test',
                LastName = 'Contact',
                AccountId = acct.id
        );
        insert con;
        return acct.id;
    }
}