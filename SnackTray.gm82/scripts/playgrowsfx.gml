///playgrowsfx(type)
//plays a skinnable growth sound effect, respecting player skin overrides
//empty string is mushroom, "2" is flower
var sfx,vol,inst,sname,sp2;

sp2=string(p2)
sname="sfx_"+name+"grow"+argument[0]+sp2

with (globalmanager) {
    vol=min(1,settings("volbalance"))
    if (playerskindat(p2,"growsfx"+argument[0]+sp2)) {
        sfx=skindat(sname)
        if (sfx) {
        stopsfx(skindat(sname+"inst"))
        inst=FMODSoundPlay(sfx,0)
        skindat(name+"inst",inst)
        return 1
        }
    } else {
        if (argument[0]="") || (argument[0]="1") sound("itempowerup")
        else if (argument[0]="2") sound("itempowerup2")
        else if (argument[0]="3") sound("itempowerup3")
        else if (argument[0]="4") sound("itemminimush")
        else if (argument[0]="5") sound("itemstar")
        //else sound("itemstar")
    }
}
return 0
