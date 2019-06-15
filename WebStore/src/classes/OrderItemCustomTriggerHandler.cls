/**
 * Created by Diz-19 on 25.03.2019.
 */

public with sharing class OrderItemCustomTriggerHandler {
    public static void beforeInsert(List<OrderItem__c> newItems){
        ItemService.removeFromStore(newItems);
    }
}