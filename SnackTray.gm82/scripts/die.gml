///die()
//sets dead state

var kek;

kek=noone
piped=1
visible=0
alarm[5]=-1
alarm[2]=-1
dead=1
if (name="kid" && !global.lemontest) {
    reset=1
    bow=0
}
deaths+=1
droprings()
//if settings("cog inflives") dropcoins(0,1)

if (global.wanna) {
    settings("kiddeath",settings("kiddeath")+1)
    global.lifes=-settings("kiddeath")
    settings("kidresetbuf",40)
}


instance_activate_object(skullblock)
instance_activate_object(skullbloff)
with (skullblock) event_user(1)
with (skullbloff) event_user(1)

if (super) stopsuper(1,1)
if (skidding) {soundstop(name+"skid") skidding=0}

if (sprongin && sprongin<120) {sprongin=0 speed=0}

if (!global.debug && global.gamemode!="battle" && global.gamemode!="coop" && global.gamemode!="sscreencoop" && !global.lemontest) gamemanager.deathtimer=1
gamemanager.deathplayer=id


kek=instance_create(x,y,charmdeath)
kek.shortsmallform=owner.shortsmallform
playsfx(name+"die")


y=-verybignumber

with (kek) {
    owner=other.id
    p2=owner.p2
    size=owner.size
    orig=owner
    xsc=esign(owner.hspeed,owner.xsc)
    sheets[size]=owner.sheets[owner.size]
    event="create"
    event_user(p2)
    charm_init()
    spriteswitch(1)
    if (playerskindat(slot,"3ddeath"+string(p2))) rotate=1
}
