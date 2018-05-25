global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Lead> leads = [Select Id, LeadSource From Lead Where LeadSource = null LIMIT 200];
        If(!leads.isEmpty()){
            for(Lead lead : leads){
                lead.LeadSource = 'Dreamforce';
            }
        }
        update leads;
    }
}