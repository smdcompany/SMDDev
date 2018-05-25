@IsTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 5 5 ?';

    static testMethod void testScheduledJob() {
        //Create lead records with blank Lead Sources
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
            Lead l = new Lead(
                    FirstName = 'Test',
                    LastName = 'Last ' + i,
                    Company = 'Test Company',
                    Status = 'Open - Not Contacted'
            );
            leads.add(l);
        }
        insert leads;

        Test.startTest();
        //Schedule the test job
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());

        Test.stopTest();

        List<Lead> ls = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, ls.size());
    }
}