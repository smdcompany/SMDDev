@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();
        //insert 10 Leads
        for(Integer i=0; i<10; i++){
            leads.add(new Lead(FirstName='Test', LastName='Last '+i, Company='Test Company'));
        }
        insert leads;
    }

    static testMethod void test(){
        Test.startTest();
        LeadProcessor leadprocess = new LeadProcessor();
        Id batchId = Database.executeBatch(leadprocess);
        Test.stopTest();

        System.assertEquals(10, [select count() from lead where FirstName = 'Test']);
    }
}