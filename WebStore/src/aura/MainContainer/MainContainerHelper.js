/**
 * Created by venzor on 3/24/2019.
 */
({
    switchComp : function (cmp, evt) {
        var catId = evt.getParam("catId");
        cmp.set("v.category", catId);
        if(catId == 0){
            cmp.set("v.switcher", false);
        } else {
            cmp.set("v.switcher", true);
        }
    }
})