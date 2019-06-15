/**
 * Created by venzor on 3/20/2019.
 */

@isTest
private class ItemQuantityServiceTest {

    @isTest static void testingSelectingByQuantity(){
        List<Item__c> listItems = new List<Item__c>();
        for(Integer i = 0; i < 6; i++){
            listItems.add(new Item__c(Quantity__c = i));
        }
        List<Item__c> itemsAfterSelecting = ItemQuantityService.selectItemsToRequest(listItems);
        System.assertEquals(3, itemsAfterSelecting.size());
        for(Integer i = 0; i < itemsAfterSelecting.size(); i++){
            System.assertEquals(5 + i, itemsAfterSelecting.get(i).Quantity__c);
        }
    }
}