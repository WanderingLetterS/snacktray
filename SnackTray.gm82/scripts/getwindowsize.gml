rw=global.screenwidth
rh=global.screenheight
if (room=scoring || room=change || room=game) {
    if (global.mplay=2) {rh=global.screenheight+4}
    if (global.mplay>2) {rw=global.screenwidth+4 rh=global.screenheight+4}
}

dw=display_get_width()
dh=display_get_height()

if (settings("fullscreen")) {
    if ((room=lemon && !global.lemontestviewhack)||(room=worldlemon && !global.lemontestviewhack)  || (room=speciale && !instance_exists(moranboll))) {rw=dw rh=dh s=1}
    else s=min(dw/rw,dh/rh)
} else {
    if (room=speciale && !instance_exists(moranboll)) {
        s=1
        rw=1074
        rh=700
    } else if ((room=lemon||room=worldlemon) && !global.lemontestviewhack) {
        s=1
        if (settings("zoomlemon")) {rw=floor(dw*0.8) rh=floor(dh*0.8)}
        else {rw=global.screenwidth rh=700}
    } else {
        s=settings("zoom")
        if (s=3) s=min(floor((dw-32)/rw),floor((dh-80)/rh))
        else if (rw*s>(dw-32) || rh*s>(dh-80)) s=min((dw-32)/rw,(dh-80)/rh)
    }
}
