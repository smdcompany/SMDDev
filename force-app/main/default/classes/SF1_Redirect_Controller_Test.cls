@isTest
public class SF1_Redirect_Controller_Test {

    public static testMethod void testPages() {
        SF1_Redirect_Controller c = new SF1_Redirect_Controller();

        Test.setCurrentPage(c.getContact());
        Test.setCurrentPage(c.getAccount());

    }

    public static testMethod void testCP() {
        Account ta = new Account();
        ta.Name = 'Test';
        ta.Type = 'Hospital';

        insert ta;

        Contact tc = new Contact();
        tc.LastName = 'TestLName';
        tc.Account = ta;

        insert tc;

        ApexPages.currentPage().getParameters().put('id', tc.Id);
        ApexPages.StandardController sc = new ApexPages.StandardController(tc);
    }

}