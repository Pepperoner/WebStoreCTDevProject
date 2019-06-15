/**
 * Created by venzor on 3/20/2019.
 */

public with sharing class ItemQuantityService {

    /*
    Select items with quantity lower then 3
    and increase quantity
     */
    public static List<Item__c> selectItemsToRequest(List<Item__c> items) {
        List<Item__c> itemsToRequest = new List<Item__c>();
        for (Item__c item : items) {
            if (item.Quantity__c < 3) {
                item.Quantity__c += 5;
                itemsToRequest.add(item);
            }
        }
        return itemsToRequest;
    }
}