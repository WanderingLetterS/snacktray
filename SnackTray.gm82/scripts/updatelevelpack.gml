var fn,tfn,path;

if (!global.lemontest) with (globalmanager) {

    {
        path=global.lskins[global.levelskin+1,0]

        if (path=global.lbase) fn=path
        else fn=moddir+path
    }

    if (!global.respawn) global.currentlevel=global.nextlevel
    tfn=fn+global.currentlevel+".lemon"
    global.lemonfilename=tfn
    if (file_exists(tfn)) {lemonloader(tfn)}
    else {
        tfn=fn+global.currentlevel+".lemon.png"
        global.lemonfilename=tfn
        global.lemon_compat=1
        if (file_exists(tfn)) {lemonloader(tfn)}
        else error(lang("error missing level")+tfn)
        global.lemon_compat=0
    }
} else if (global.lemontest && global.respawn) with (globalmanager) {
    lemonloader("test")
} else if (global.lemontest && !global.respawn) {room_goto_safe(lemon) exit}

with (globalmanager) {
    loadspec=0
    for (i = 0; i < 8; i += 1) {
        if (getbiomeid(lemongrab.typeobj[i]) != -1 && !global.biomesloaded[getbiomeid(lemongrab.typeobj[i])]) {
            global.biomesloaded[getbiomeid(lemongrab.typeobj[i])]=1
            loadspec |= (1 << getbiomeid(lemongrab.typeobj[i]))
        }
        if (getbiomeid(lemongrab.typebg[i]) != -1 && !global.biomesloaded[getbiomeid(lemongrab.typebg[i])]) {
            global.biomesloaded[getbiomeid(lemongrab.typebg[i])]=1
            loadspec |= (1 << getbiomeid(lemongrab.typebg[i]))
        }
        if (getbiomeid(lemongrab.typemus[i]) != -1 && !global.biomesloaded[getbiomeid(lemongrab.typemus[i])]) {
            global.biomesloaded[getbiomeid(lemongrab.typemus[i])]=1
            loadspec |= (1 << getbiomeid(lemongrab.typemus[i]))
        }
    }
    for (i=0;i<global.biomes;i+=1) {
        if (tylerbiomes[i] && !global.biomesloaded[i])
            loadspec |= (1 << i)
    }
    if loadspec=0 loadspec=-1
}
