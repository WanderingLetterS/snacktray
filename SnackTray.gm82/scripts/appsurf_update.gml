with (globalmanager) {
    appsurf=sureface("appsurf",global.screenwidth,global.screenheight)

    if (global.fuzzy && !irandom(10)) return 0;

    if (!sureface_set_target("appsurf")) return 0
    d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)
    with (gamemanager) for (i=0;i<global.mplay;i+=1) {
        if (view_visible[i]) {
         memy[i]=view_yview[i]
         view_yview[i]+=shake[i]+skindat("voffset")
         }
    }
    //frameskip_update(argument[0])
    //if (!settings("frameskip")) screen_redraw() global.fstime=0 //no frameskip
    //frameskip_update(0)

    screen_redraw()

    with (gamemanager) for (i=0;i<global.mplay;i+=1) view_yview[i]=memy[i]

    surface_reset_target()
    if (!sureface_set_target("appsurf")) return 0
    d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)
    if (volkill<1) rect(0,0,global.screenwidth,global.screenheight,$ffffff,1-volkill)
    draw_set_blend_mode(bm_add)
    rect(0,0,global.screenwidth,global.screenheight,0,1)
    draw_set_blend_mode(0)
    surface_reset_target()

}
return 1
