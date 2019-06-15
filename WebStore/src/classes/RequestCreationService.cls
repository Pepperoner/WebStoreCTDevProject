/**
 * Created by venzor on 3/20/2019.
 */

public with sharing class RequestCreationService {
    public static void createRequestForItem(List<Item__c> items) {
        List<Item__c> itemsToRequest = ItemQuantityService.selectItemsToRequest(items);
        List<Request_for_Item__c> requestsForItems = generateRequests(itemsToRequest);
        if(requestsForItems != null){
            insert requestsForItems;
        }
    }



    /*
    Create requests for items
     */
    private static List<Request_for_Item__c> generateRequests(List<Item__c> items) {
        if (items.size() == 0) {
            return null;
        }

        List<Request_for_Item__c> requestsForItems = new List<Request_for_Item__c>();
        for (Item__c item : items) {
            requestsForItems.add(new Request_for_Item__c(
                    Item_Name__c = item.Name,
                    Item_ID__c = item.Id,
                    Quantity__c = 5));
        }
        return requestsForItems;
    }

}