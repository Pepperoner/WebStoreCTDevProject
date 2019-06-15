/**
 * Created by Diz-19 on 25.03.2019.
 */

public with sharing class ItemService {

    public static void removeFromStore(List<OrderItem__c> orders){
        List<id> itemsIds = new List<Id>();
        for(OrderItem__c ord : orders){
            itemsIds.add(ord.Item__c);
        }
        List<Item__c> itemList = [
                SELECT Id, Quantity__c
                FROM Item__c
                WHERE Id IN :itemsIds
        ];

        Map<Id, Item__c> itemMap = new Map<Id, Item__c>(itemList);

        for(OrderItem__c ord : orders){
            Item__c item = itemMap.get(ord.Item__c);
            item.Quantity__c -= ord.Quantity__c;
            itemMap.put(item.Id, item);
        }
        upsert itemMap.values();
    }
}