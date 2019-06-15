/**
 * Created by venzor on 3/20/2019.
 */

trigger ItemTrigger on Item__c (before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            ItemTriggerHandler.beforeInsert(Trigger.new);
        } else if(Trigger.isUpdate){
            ItemTriggerHandler.beforeUpdate(Trigger.new);
        }
    }

}