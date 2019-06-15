/**
 * Created by Diz-19 on 25.03.2019.
 */

trigger OrderItemCustomTrigger on OrderItem__c (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            OrderItemCustomTriggerHandler.beforeInsert(Trigger.new);
        }
    }

}