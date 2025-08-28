//manage collision between players
//all the code is doubled because this only runs once
var momentum;

with (other)
if (flash || hurt || piped || intangible() || global.gamemode="coop" || global.gamemode="sscreencoop") exit
if (flash || hurt || piped || intangible() || global.gamemode="coop" || global.gamemode="sscreencoop") exit

with (other)
if (spin && other.name="knux" && other.crouch && !other.spindash && sign(x-other.x)=other.xsc) {hsp=abs(hsp)*other.xsc exit}
if (spin && other.name="knux" && other.crouch && !other.spindash && sign(x-other.x)=other.xsc) {hsp=abs(hsp)*other.xsc exit}

if (pvp_spin && other.pvp_spin && pvp_ignore=0 && other.pvp_ignore=0) {
    momentum=hsp*weight-other.hsp*other.weight
    if (momentum<=0) exit

    hsp-=momentum/weight
    other.hsp+=momentum/other.weight

    xsc=esign(hsp,xsc)
    other.xsc=esign(other.hsp,other.xsc)

    sound("itemblockbump")
    instance_create(mean(x,other.x),mean(y,other.y),kickpart)
}
with (other)
if ((pvp_stomper) && !star) if (vsp>0 && y<other.y && !other.star && !other.pvp_avoid) {
    if (!stomplok) {
        vsp=-2.5-akey*1.5
        sound("enemystomp")
        coll=other.id
        doscore_p()
        if (spinjump) {
            if (vsp>0 && !other.spin) {stunlock(id,other.id) with (other) { if other.pvp_knockaway=1 knockplayer(other.id) else fragplayer(other.id)}}
        } else {
            stomplok=10
            if (other.jump) other.vsp=3
            if (other.spin) {other.hsp=0 other.spin=0 other.rise=other.xsc}
            else if (size>0) with (other) {stunlock(id,other.id) {if other.pvp_knockaway=1 knockplayer(other.id) else fragplayer(other.id)}}
        }
    }
    exit
}
if ((pvp_stomper) && !star) if (vsp>0 && y<other.y && !other.star && !other.pvp_avoid) {
    if (!stomplok && !other.carry) {
        vsp=-2.5-akey*1.5
        sound("enemystomp")
        coll=other.id
        doscore_p()
        if (spinjump) {
            if (vsp>0 && !other.spin) {stunlock(id,other.id) with (other) { if other.pvp_knockaway=1 knockplayer(other.id) else fragplayer(other.id)}}
        } else {
            stomplok=10
            if (other.jump) other.vsp=3
            if (other.spin) {other.hsp=0 other.spin=0 other.rise=other.xsc}
            else if (size>0) with (other)  {stunlock(id,other.id) {if other.pvp_knockaway=1 knockplayer(other.id) else fragplayer(other.id)}}
        }
    }
    exit
}

with (other)
if (power_lv<other.power_lv && pvp_ignore=0) {stunlock(id,other.id) if other.pvp_knockaway=1 knockplayer(other.id) else fragplayer(other.id) if (name="robo") with (other) eject()}
if (power_lv<other.power_lv && pvp_ignore=0) {stunlock(id,other.id) if other.pvp_knockaway=1 knockplayer(other.id) else fragplayer(other.id) if (name="robo") with (other) eject()}

with (other)
if (!hurt && pound && (!size || other.name="robo") && pvp_ignore=0) {pound=0 fall=1 vsp=-1}
if (!hurt && pound && (!size || other.name="robo") && pvp_ignore=0) {pound=0 fall=1 vsp=-1}
