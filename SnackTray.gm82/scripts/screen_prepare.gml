//set target to application surface
//and general screen preparation

with (globalmanager) {
    sureface_update()

    with (editmanager) exit
    with (specialectrl) exit

    appsurf=sureface("appsurf",global.screenwidth,global.screenheight)
    if !surface_exists(appsurf) show_message("The End of appsurf")
    sureface_set_target("appsurf")

    //process screenshake
    with (gamemanager) for (i=0;i<global.mplay;i+=1) {
         memy[i]=view_yview[i]
         view_yview[i]+=shake[i]+skindat("voffset")
    }

    global.frameskipcounter+=1
    //frameskip_update(1)

    if (scheduled_clear) {
        scheduled_clear=0
        draw_clear(0)
    }
}
