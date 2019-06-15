/**
 * Created by venzor on 3/24/2019.
 */
({
    initList: function (cmp) {
        var action = cmp.get("c.getItemsByCategoryId");
        action.setParams({"catId": cmp.get("v.catId")});
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.items", response.getReturnValue());
            }
        })
        $A.enqueueAction(action);

    }


    

})