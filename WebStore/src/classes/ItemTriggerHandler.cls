/**
 * Created by venzor on 3/20/2019.
 */

public with sharing class ItemTriggerHandler {
    public static void beforeInsert(List<Item__c> newItems){
        ItemValidationService.checkItemsInput(newItems);
        RequestCreationService.createRequestForItem(newItems);
    }

    public static void beforeUpdate(List<Item__c> newItems){
        RequestCreationService.createRequestForItem(newItems);
    }


}