public class AddPrimaryContact implements Queueable{

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact contact, String state){
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context){
        List<Account> accounts = [select Id, BillingState from Account where BillingState = :state limit 200];
        List<Contact> contacts = new List<Contact>();

        for(Account account :accounts){
            Contact cont = contact.clone(false,false,false,false);
            cont.AccountId = account.Id;
            contacts.add(contact);
        }
        insert contacts;
    }
}