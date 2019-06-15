/**
 * Created by venzor on 3/24/2019.
 */
({
    confirmOrder: function (cmp, evt, hlp) {
        hlp.confirmOrder(cmp);
    },
    cancelOrder: function (cmp, evt, hlp) {
        hlp.cancelOrder(cmp);
    },
    createOrder: function (cmp, evt, hlp) {
        hlp.createOrder(cmp, evt);
    },
    addItem: function (cmp, evt, hlp) {
        hlp.addItem(cmp, evt);
    },
    changeQuantity: function (cmp, evt, hlp) {
        hlp.updareElement(cmp, evt);
    }

})