var i;

if (instance_exists(drawregion)) if (!drawregion.unchanged) if (!show_question("You have unsaved changes!##Discard?")) exit

instance_activate_object(objcontainer)
instance_activate_object(watercontainer)
instance_activate_object(semicontainer)
instance_activate_object(backcontainer)
with (objcontainer) instance_destroy()
with (watercontainer) instance_destroy()
with (semicontainer) instance_destroy()
with (backcontainer) instance_destroy()

with (editmanager) {
    i=0
    repeat (undocount) {
        file_delete(global.tempdir+"undo"+string(i)+".gms")
        i+=1
    }
    undocount=0
}

with (lemongrab) {
    levelname="World X-Y"
    leveldesc=""
    time=300
    thumbregion=0
    thumbx=1
    thumby=4
    spawnx=4
    spawny=11
    spawnr=0
    tspawnx=3
    tspawny=11
    tspawnr=0
    for (i=0;i<8;i+=1) {
        w[i]=25
        h[i]=14
        water[i]=0
        horizon[i]=1
        bpm[i]=110
        bpb[i]=8
        lightlevel[i]=0
        typeobj[i]=getbiomename(0)
        typebg[i]=getbiomename(0)
        typemus[i]=getbiomename(0)
        for (j=0;j<72;j+=1) {cambitmap[i,j]=0 cambitmap2[i,j]=0}
    }
}
with (drawregion) {
    deity=lemongrab.gods[0]
    viewx=lemongrab.w[0]*8
    viewy=lemongrab.h[0]*9
    region=0
    unchanged=1
    if (argument[0]) {
        global.lemoncusthumb=""
        //replaceasset(globalmanager.wskin)
        if (argument[0] == 2) { //new time-saving technique: have editnew use 0, 1, and 2 as arguments for different behavior. when its only used 3 times in the entire game
            global.lemonlskin="None"
        }
        global.lemonfilename=""
        for (i=0;i<25;i+=1) {
            with (instance_create(i,12,deity)) {spr=spr_ground obj=groundblock}
            with (instance_create(i,13,deity)) {spr=spr_ground obj=groundblock}
        }
        with (regionbutton) empty=!!n
    }

    UPDATE_THE_DEITIES=1
    event_user(7)
}

with (editzoom) {
    zoom=4
    center=1
    event_user(0)
    xd=xdgo
}

if (argument[0] == 1) if !(settings("nolemonsound")) sound("lemonnuke")
