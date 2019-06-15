/**
 * Created by venzor on 3/23/2019.
 */
({
    sendToBasket : function (cmp) {
        var item = cmp.get("v.itemToView");
        var count = cmp.get("v.itemCount");
        var ev = $A.get("e.c:AddToBasketEvent");
        ev.setParams({
            "item": item,
            "count": count
        });
        ev.fire();
    }

})