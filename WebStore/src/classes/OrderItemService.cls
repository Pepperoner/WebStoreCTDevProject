/**
 * Created by Diz-19 on 25.03.2019.
 */

public with sharing class OrderItemService {

    public static void saveNewOrderItems(List<OrderItem__c> items, OrderSale__c orderSale){
        items = setOrderToItems(items, orderSale);
        insert items;
    }

    private static List<OrderItem__c> setOrderToItems(List<OrderItem__c> items, OrderSale__c orderSale){
        for(OrderItem__c item : items){
            item.OrderSale__c = orderSale.Id;
        }
        return items;
    }


}