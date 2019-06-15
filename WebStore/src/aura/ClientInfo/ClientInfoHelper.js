/**
 * Created by venzor on 3/24/2019.
 */
({
    createOrder : function (cmp) {
        var ev = cmp.getEvent("createOrder");
        var info = "Tel.: " + cmp.get("v.phone") + ". Address: " + cmp.get("v.address");
        ev.setParams({
            "clientInfo" : info
        });
        ev.fire();
    }
})