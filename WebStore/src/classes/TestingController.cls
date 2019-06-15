/**
 * Created by venzor on 3/22/2019.
 */

public with sharing class TestingController {

    @AuraEnabled
    public static Item__c getItemforTest(){
        Item__c item = [SELECT Id, Name, Price__c, Description__c, Picture_URL__c FROM Item__c WHERE Id = 'a011i000005i3q3AAA'];
        return item;
    }
}