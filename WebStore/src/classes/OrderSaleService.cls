/**
 * Created by Diz-19 on 25.03.2019.
 */

public with sharing class OrderSaleService {

    public static OrderSale__c saveOrderSale(OrderSale__c orderSale) {
        insert orderSale;
        return [
                SELECT Id, OdrerNumber__c
                FROM OrderSale__c
                WHERE Id = :orderSale.Id
        ];
    }
}