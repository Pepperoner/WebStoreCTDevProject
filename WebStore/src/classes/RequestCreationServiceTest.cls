/**
 * Created by venzor on 3/20/2019.
 */

@isTest
private class RequestCreationServiceTest {
    private static final Integer MIN_QUANTITY = 3;
    private static final Integer LIST_SIZE = 4;
    private static final String ITEM_NAME = 'test item';
    private static final Integer NEW_LIST_SIZE;

    static {
        NEW_LIST_SIZE = MIN_QUANTITY <= LIST_SIZE ? MIN_QUANTITY : LIST_SIZE;
    }

    @isTest static void testingRequestCreation() {
        Test.startTest();
        ItemCategory__c category = new ItemCategory__c();
        insert category;
        List<Item__c> listItems = new List<Item__c>();

        for (Integer i = 0; i < LIST_SIZE; i++) {
            listItems.add(new Item__c(
                    Name = ITEM_NAME,
                    Quantity__c = i,
                    ItemCategory__c = category.Id));
        }

        List<Request_for_Item__c> requestList = getRequests();
        System.assertEquals(0, requestList.size());
        insert listItems;
        requestList = getRequests();
        System.assertEquals(NEW_LIST_SIZE, requestList.size());
        listItems = [
                SELECT Id, Name, Quantity__c
                FROM Item__c
                WHERE Name = :ITEM_NAME
        ];
        for (Item__c item : listItems) {
            item.Quantity__c = 10;
        }
        upsert listItems;
        requestList = getRequests();
        System.assertEquals(NEW_LIST_SIZE, requestList.size());
        Test.stopTest();

    }

    private static List<Request_for_Item__c> getRequests() {
        return [
                SELECT Id
                FROM Request_for_Item__c
                WHERE Item_Name__c = :ITEM_NAME
        ];
    }

}