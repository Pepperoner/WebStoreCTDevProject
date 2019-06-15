/**
 * Created by venzor on 3/20/2019.
 */

public with sharing class ItemValidationService {
    public static void checkItemsInput(List<Item__c> itemsForCheck){
       for(Item__c item : itemsForCheck){
           if(item.Quantity__c < 0){
               item.Quantity__c = 0;
           }
           if(item.Price__c < 0){
               item.Price__c = Math.abs(item.Price__c);
           }
       }
    }
}