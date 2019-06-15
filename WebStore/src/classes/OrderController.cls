/**
 * Created by Diz-19 on 25.03.2019.
 */

public with sharing class OrderController {
    @AuraEnabled
    public static OrderSale__c saveOrder(OrderSale__c orderSale, List<OrderItem__c> items) {
        orderSale = OrderSaleService.saveOrderSale(orderSale);
        OrderItemService.saveNewOrderItems(items, orderSale);
        return orderSale;
    }

}