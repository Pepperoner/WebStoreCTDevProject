/**
 * Created by Diz-19 on 25.03.2019.
 */
({
    backToCategories : function (cmp) {
        var ev = $A.get("e.c:ChangeComponentEvent");
        ev.setParams({
            "catId": "0"
        });
        ev.fire();
    }
})