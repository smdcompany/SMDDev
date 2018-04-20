/**
 * Created by sdykstra on 2/7/18.
 */

public class AgentContributionArticleController {
    public AgentContributionArticleController(ApexPages.KnowledgeArticleVersionStandardController ctl){
        SObject article = ctl.getRecord();

        //return id from the case that is closed
        String sourceId = ctl.getSourceId();

        Case c = [SELECT Subject, Description FROM Case WHERE id=:sourceId];

        article.put('Title', 'From Case: ' + c.Subject);
        article.put('Details__c', c.Description);

        ctl.selectDataCategory('Geography', 'USA');
        ctl.selectDataCategory('Topic', 'Maintenance');
    }
}