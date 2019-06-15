/**
 * Created by venzor on 3/23/2019.
 */

public with sharing class ItemCategoryController {

    @AuraEnabled
    public static List<ItemCategory__c> getAllCategories() {
        return [
                SELECT Id, Name, Imeg_URL__c, Quantity__c
                FROM ItemCategory__c
        ];
    }
}