public class SF1_Redirect_Controller {

    public SF1_Redirect_Controller() {
    }

    public PageReference getContact() {
        String returnValues = '/003/o';
        PageReference retURL = new PageReference(returnValues);
        retURL.setRedirect(true);
        return retURL;
    }

    public PageReference getAccount() {
        String returnValues = '/001/o';
        PageReference retURL = new PageReference(returnValues);
        retURL.setRedirect(true);
        return retURL;
    }

    public PageReference getReport() {
        String returnValues = '/00O/o';
        PageReference retURL = new PageReference(returnValues);
        retURL.setRedirect(true);
        return retURL;
    }

    public PageReference getDashboard() {
        String returnValues = '/01Z/o';
        PageReference retURL = new PageReference(returnValues);
        retURL.setRedirect(true);
        return retURL;
    }

}