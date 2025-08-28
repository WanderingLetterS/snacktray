with (specialectrl) {
    workingfn=""
    with (specialeobj) instance_destroy()
    check[0]=0
    check[1]=0
    check[2]=0
    time=30
    view_xview[0]=round(31*32-1074/2)
    view_yview[0]=round(31*32-700/2)
    with (specialepal) {
        x=view_xview[0]+xstart
        y=view_yview[0]+ystart
    }
    with (specialemenu) {
        x=view_xview[0]+xstart
        y=view_yview[0]+ystart
    }
    if (argument[0]) instance_create(31*32,31*32,specialeobj)
}
