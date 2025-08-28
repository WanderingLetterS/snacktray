///knockplayer(offender)
//generic knockback initiator

if (hurt || star || global.gamemode="coop" || global.gamemode="sscreencoop") exit

if (argument[0].flash || flash) exit
if (argument[0]!=id) argument[0].frags+=1

pipe=0
sprongin=0
speed=0
if (skidding) {soundstop(name+"skid") skidding=0}
if (carry && carryid) {with (carryid) event_user(0) carryid=noone carry=0}
braking=0
grow=0
gk=0
fk=0


fly=0
jet=0
climb=0
braking=0
rise=0
slide=0
glide=0
sprung=0
fall=0
pound=0
playsfx(name+"damage")
set_sprite("hurt")

if (name="mario" || name="luigi") {
    fired=0
    flash=1
} else if (name="robo") {
    flash=1 jetdead=1 frspd=0.5 piped=1 alarm[4]=20
    if (!size && (spin || spindash)) {rise=xsc spindash=0 frame=1 frspd=0}
} else {
    jump=1 hurt=2 hsp=xsc*-2*wf vsp=-3*wf
}
