with (specialectrl) {
    specialebuild()
    sound("systemgo")
    specialehud.alpha=0
    global.special=9999
    global.moranplayed[global.special]=0
    global.emeralds=0
    with (specialemenu) visible=0
    with (specialehud) visible=0
    with (specialecheck) visible=0
    with (specialepal) visible=0
    with (specialecur) visible=0
    with (specialeobj) visible=0
    with (specialeghost) visible=0
    global.sty=view_yview[0]
    view_yview[0]=0
    instance_create(0,0,moranboll)
    windowhandler()
}
instance_deactivate_object(specialectrl) //trust the process
