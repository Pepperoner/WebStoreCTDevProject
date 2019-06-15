/**
 * Created by venzor on 3/23/2019.
 */

public with sharing class ItemController {
    @AuraEnabled
    public static Item__c getItemById(Id idToDisplay) {
        Item__c item = [
                SELECT Id, Name, Price__c, Description__c, Picture_URL__c
                FROM Item__c
                WHERE Id = :idToDisplay
        ];
        return item;
    }

    @AuraEnabled
    public static List<Item__c> getItemsByCategoryId(Id catId) {
        List<Item__c> itemList = [
                SELECT Id, Name, Price__c, Description__c, Picture_URL__c, Quantity__c
                FROM Item__c
                WHERE ItemCategory__c = :catId
        ];
        return itemList;
    }
}