/**
 * Created by venzor on 3/25/2019.
 */
({
    changeQuantity: function (cmp, count) {
        var ev = cmp.getEvent("changeQuantity");
        var item = cmp.get("v.orderItem");
        ev.setParams({
            "itemId": item.Item__c,
            "quantity": count
        });
        ev.fire();
    }
})