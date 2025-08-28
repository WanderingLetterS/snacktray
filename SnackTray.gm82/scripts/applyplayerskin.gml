///applyplayerskin(directory,slot,"all",character) load all for this character
///applyplayerskin(directory,slot,"less",character) for roster, loads less
///applyplayerskin(directory,slot,"more",character) for roster end
///applyplayerskin(directory,-1) player base

//applies a player skin to the specified slot
var i,what,slot,char,path,play;

path=argument[0]
slot=argument[1]
if (argument_count=2) {
    what="all"
    char=0
} else {
    what=argument[2]
    char=argument[3]
}

//make sure base is applied before changing skins   NOT!! HAHA!!
//if (path!=global.pbase) applyplayerskin(global.pbase,slot,what,char)

with (globalmanager) {
    if (skindat("bundleplayer") || path=global.pbase) skin=path
    else skin=skindir+path
    play=""
    if skin == global.pbase play=global.charname[char]+"\" //fix for base skins saying player.txt is in the player directory instead of the achual characters (1.9 leftover?)

    if (skin=global.pbase) {
        if (global.charmod[char]) {

            //This is it, Luigi, the Ultimate Skin Nuke. - -S-
            if ((what="less" && (room==roster || room==ta_roster)) ||what="all"){
                ds_map_destroy(globalmanager.playerskinmap[slot])
                globalmanager.playerskinmap[slot]=ds_map_create()
            }
            loaddefaultdat(slot,global.charname[char])
            if (what="more" || what="all") playerskinstr(slot,"infotxt"+string(slot),moddir+"character\"+global.charname[char]+"\player.txt")
            replaceplayerinfo(slot,moddir+"character\"+global.charname[char]+"\player.txt")
            replacecharacter(char,slot,what,moddir+"character\"+global.charname[char]+"\")
        } else {

            if ((what="less" && (room==roster || room==ta_roster)) ||what="all"){
                ds_map_destroy(globalmanager.playerskinmap[slot])
                globalmanager.playerskinmap[slot]=ds_map_create()
            }
            loaddefaultdat(slot,global.charname[char])
            if (what="more" || what="all") playerskinstr(slot,"infotxt"+string(slot),skin+global.charname[char]+"\player.txt")
            replaceplayerinfo(slot,skin+global.charname[char]+"\player.txt")
            //replacecharacter(char,slot,what,skin+"_shared\")
            replacecharacter(char,slot,what,skin+global.charname[char]+"\")
        }
    } else {

        if ((what="less" && (room==roster || room==ta_roster)) ||what="all"){ //no base data either get out!!!!
            ds_map_destroy(globalmanager.playerskinmap[slot])
            globalmanager.playerskinmap[slot]=ds_map_create()
        }

        loaddefaultdat(slot,global.charname[char])
        if (what="more" || what="all") playerskinstr(slot,"infotxt"+string(slot),skin+play+"player.txt")
        replaceplayerinfo(slot,skin+"player.txt")
        replacecharacter(char,slot,what,skin)

    }

    return 1
}
return 0
