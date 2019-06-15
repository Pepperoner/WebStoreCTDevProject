/**
 * Created by venzor on 3/25/2019.
 */
({
    removeItem : function(cmp, evt, hlp){
        var item = cmp.get("v.orderItem");
        hlp.changeQuantity(cmp, -item.Quantity__c);
    },

    incItem : function(cmp, evt, hlp){
        hlp.changeQuantity(cmp, 1);
    },

    decItem : function(cmp, evt, hlp){
        hlp.changeQuantity(cmp, -1);
    }
})