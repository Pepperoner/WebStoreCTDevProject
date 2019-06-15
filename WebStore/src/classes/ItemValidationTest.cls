/**
 * Created by venzor on 3/20/2019.
 */
@isTest
private class ItemValidationTest {

    @isTest static void testWrongQuantity() {
        Item__c testItem = new Item__c(
                                     Name = 'test',
                                     Price__c = 10.0,
                                     Quantity__c = -5);
        List<Item__c> listForTest = new List<Item__c>();
        listForTest.add(testItem);
        ItemValidationService.checkItemsInput(listForTest);
        System.assertEquals(0, testItem.Quantity__c);
    }

    @isTest static void testWrongPrice() {
        Item__c testItem = new Item__c(
                Name = 'test',
                Price__c = -10.0,
                Quantity__c = 5);
        List<Item__c> listForTest = new List<Item__c>();
        listForTest.add(testItem);
        ItemValidationService.checkItemsInput(listForTest);
        System.assertEquals(10, testItem.Price__c);
    }

}