/**
 * Created by venzor on 3/24/2019.
 */
({
    goToItems : function (cmp, evt, hlp) {
        var ev = $A.get("e.c:ChangeComponentEvent");
        ev.setParams({
            "catId": cmp.get("v.category.Id")
        });
        ev.fire();

    }
})