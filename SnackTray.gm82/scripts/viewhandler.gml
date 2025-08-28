///viewhandler(zoom level)
//updates views to account for the pixel hack

view_visible[0]=1
view_visible[1]=0
view_visible[2]=0
view_visible[3]=0

view_wport[0]=global.screenwidth
view_hport[0]=global.screenheight
view_wport[1]=global.screenwidth
view_hport[1]=global.screenheight
view_wport[2]=global.screenwidth
view_hport[2]=global.screenheight
view_wport[3]=global.screenwidth
view_hport[3]=global.screenheight

view_xport[0]=0
view_yport[0]=0

if (global.mplay=2 && global.gamemode!="sscreencoop") {
    view_xport[1]=0
    view_yport[1]=global.screenheight+4
    view_visible[1]=1
    view_visible[2]=0
    view_visible[3]=0
}
if (global.mplay=3  && global.gamemode!="sscreencoop") {
    view_xport[1]=global.screenwidth+4
    view_yport[1]=0
    view_xport[2]=global.screenheight/2-12
    view_yport[2]=global.screenheight+4
    view_visible[1]=1
    view_visible[2]=1
    view_visible[3]=0
}
if (global.mplay=4  && global.gamemode!="sscreencoop") {
    view_wport[0]=global.screenwidth/2
    view_hport[0]=global.screenheight/2
    view_wport[1]=global.screenwidth/2
    view_hport[1]=global.screenheight/2
    view_wport[2]=global.screenwidth/2
    view_hport[2]=global.screenheight/2
    view_wport[3]=global.screenwidth/2
    view_hport[3]=global.screenheight/2

    view_xport[1]=global.screenwidth/2+4
    view_yport[1]=0
    view_xport[2]=0
    view_yport[2]=global.screenheight/2+4
    view_xport[3]=global.screenwidth/2+4
    view_yport[3]=global.screenheight/2+4
    view_visible[1]=1
    view_visible[2]=1
    view_visible[3]=1
}

if (room=lemon) {
    view_wview[0]=rw
    view_hview[0]=rh
    view_wport[0]=view_wview[0]
    view_hport[0]=view_hview[0]
}
if (room=speciale && !instance_exists(moranboll)) {
    view_wview[0]=rw
    view_hview[0]=rh
    view_wport[0]=view_wview[0]
    view_hport[0]=view_hview[0]
}

var sw,sh;
for (i=0;i<(4);i+=1) {
    if (global.fool && argument[0]!=1) {
        sw=dw/rw
        sh=dh/rh
        view_xport[i]=floor(view_xport[i]*sw)
        view_yport[i]=floor(view_yport[i]*sh)
        view_wport[i]=ceil(view_wport[i]*sw)
        view_hport[i]=ceil(view_hport[i]*sh)
    } else {
        view_xport[i]=floor(view_xport[i]*argument[0])
        view_yport[i]=floor(view_yport[i]*argument[0])
        view_wport[i]=ceil(view_wport[i]*argument[0])
        view_hport[i]=ceil(view_hport[i]*argument[0])
    }
}
