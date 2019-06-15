/**
 * Created by venzor on 3/24/2019.
 */
({
    addItem: function (cmp, evt) {
        cmp.set("v.clearList", false);
        var item = evt.getParam("item");
        var delta = evt.getParam("count");
        var listOrders = cmp.get("v.orderList");
        var index = this.findElement(listOrders, item.Id);
        if (index === -1) {
            listOrders.push({
                'sobjectType': 'OrderItem__c',
                'Item__c': item.Id,
                'Quantity__c': parseInt(delta),
                'Quantity_in_store__c': parseInt(item.Quantity__c),
                'Price__c': item.Price__c,
                'Preview__c': item.Picture_URL__c
            });
        } else {
            var quant = listOrders[index].Quantity__c + parseInt(delta);
            listOrders[index].Quantity__c =
                quant < listOrders[index].Quantity_in_store__c ?
                    quant : listOrders[index].Quantity_in_store__c;
        }
        cmp.set("v.orderList", listOrders);
        this.updateTotalCost(cmp);
    },

    findElement: function (arr, itemId) {
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].Item__c === itemId) {
                return i;
            }
        }
        return -1;
    },

    updareElement: function (cmp, evt) {
        var itemid = evt.getParam("itemId");
        var delta = evt.getParam("quantity");
        var listOrders = cmp.get("v.orderList");
        var index = this.findElement(listOrders, itemid);
        var quant = listOrders[index].Quantity__c + parseInt(delta);
        if (quant === 0) {
            listOrders.splice(index, 1);
            if (listOrders.length === 0) {
                this.cancelOrder(cmp);
            }
        } else {
            listOrders[index].Quantity__c =
                quant < listOrders[index].Quantity_in_store__c ?
                    quant : listOrders[index].Quantity_in_store__c;
        }
        cmp.set("v.orderList", listOrders);
        this.updateTotalCost(cmp);
    },

    updateTotalCost: function (cmp) {
        var cost = 0;
        var arr = cmp.get("v.orderList");
        arr.forEach(function (item, i, arr) {
            cost += item.Quantity__c * item.Price__c;
        });
        cmp.set("v.totalPrice", cost);
    },

    confirmOrder: function (cmp) {
        cmp.set("v.confirm", true);
    },

    cancelOrder: function (cmp) {
        cmp.set("v.confirm", false);
        cmp.set("v.clearList", true);
        cmp.set("v.orderList", []);
        cmp.set("v.totalPrice", 0);
    },

    createOrder: function (cmp, evt) {
        var ord = {
            'sobjectType': 'OrderSale__c',
            'Customer_Info__c': evt.getParam("clientInfo"),
            'Total_Cost__c': cmp.get("v.totalPrice"),
        };
        var itemList = cmp.get("v.orderList");
        var action = cmp.get("c.saveOrder");
        action.setParams({
            'orderSale': ord,
            'items': itemList
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                this.cancelOrder(cmp);
                this.reloadEvent();
                alert("Order " + response.getReturnValue().OdrerNumber__c + " was created");
            }
        });
        $A.enqueueAction(action);
    },

    reloadEvent : function () {
        var ev = $A.get("e.c:ReloadComponentEvent");
        ev.fire();
    }

})