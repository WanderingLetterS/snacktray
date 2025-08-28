#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
wigurn=-1
hspeed=0
redturn=1
enemy2=1

sprite="bombshell"
fast=-0.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if firstframe=1 {
visible=1
}
if !firstframe firstframe=1
if object_index=lakitu exit
if (trap) {
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    x-=hspeed
    y-=vspeed
} else if (active && !carry && !throwncolls) {
    if (wakehit) {wakehit-=1 if (wakehit=0) with (hitplayer) hurtplayer("enemy")}
    x+=hsp
    hsp=max(0,abs(hsp)-0.0625)*sign(hsp)
    calcmoving()
    if (vspeed<0) {
        coll=collision(0,vspeed)
        if (coll) {
            y=coll.bbox_bottom+(y-bbox_top)+1
            vspeed=1
        } else vspeed=min(3,vspeed+grav)
    } else {
        yground=easyground()
        if (bbox_bottom>=yground-2-2*(vspeed=0) && yground!=verybignumber) {
            if (vspeed!=0 && object_index=spiny && instance_exists(player))
                hspeed=0.5*esign((nearestplayer()).x-x,-1)
            vspeed=0
            if (hsp!=0) vspeed=-abs(hsp)
            y=floor(y)
            y=yground-(bbox_bottom+1-y)
            if (object_index=hopkoopa ) vspeed=-2.75
            if (object_index=paragoomba ){
                bouncecount+=1
                if bouncecount=4 {cooldown=60*!brat bouncecount=0 if brat hspeed*=-1}
                if bouncecount=3 vspeed=-2.75-brat
                if bouncecount=2 vspeed=-1
                if bouncecount=1 {if cooldown {cooldown-=1 bouncecount=0} else vspeed=-1 }
                if sign(nearestplayer().x-x)!=sign(hspeed) && cooldown && !brat {cooldown=0 hspeed*=-1}

            }
            grounded=1
            redturn=1
        } else {
            if (((brat && object_index!=paragoomba) || ((object_index=redkoopa || object_index=blukoopa || object_index=bombshellkoopa) && !paramode) || object_index=crabmeat || object_index=wigglerhead || object_index=wigglerbod ) && redturn) {
                redturn=0 hspeed*=-1 x+=hspeed
            }
            if ((object_index=yelkoopa && !paramode && grounded)){
                redturn=0 vspeed=-4
            }

            grounded=0
            vspeed=min(3,vspeed+grav)
        }
    }
    turnaround()

    if (turncount) turncount-=1
    else {
        oxsc=xsc
        if (!revive) xsc=-esign(hspeed,-1)
        if (xsc!=oxsc) turncount=10
    }
}

atartmove-=1

if atartmove=0
{
hspeed=fast
}

if atartmove < -1
atartmove=-1

if wigglehead.anger=1 && anger=0
{
anger=1
hspeed=fast
fast=1*xsc
}

if wigurn wigurn-=1
if !wigurn wigurn=-1
