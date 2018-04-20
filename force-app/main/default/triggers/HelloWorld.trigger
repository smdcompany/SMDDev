/**
 * Created by sdykstra on 3/13/18.
 */

trigger HelloWorld on Lead (before update) {
    for (Lead l : Trigger.new){
        l.FirstName = 'Hello';
        l.LastName = 'World';
    }
}