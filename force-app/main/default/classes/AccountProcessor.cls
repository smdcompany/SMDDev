public class AccountProcessor {
    @future(callout=true)

    public static void countContacts(List<Id> acctIds){
        List<Account> lstAcct = [Select Id, Number_of_Contacts__c, (Select Id From Contacts) FROM Account Where Id IN :acctIds];

        for(Account acc : lstAcct){
            List<Contact> lstCon = acc.Contacts;
            acc.Number_of_Contacts__c = lstCon.size();
        }
        update lstAcct;
    }
}