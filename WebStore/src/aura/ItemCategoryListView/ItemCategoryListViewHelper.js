/**
 * Created by Pepperoner on 25.03.2019.
 */
({
    onInit : function (cmp) {
        var action = cmp.get("c.getAllCategories");
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.categories", response.getReturnValue());
            }
        })
        $A.enqueueAction(action);
    }
})