#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
hspeed=-0.5
redturn=1
enemy2=1
sprite="bombshelldead"
wigbod=0
bodturn=0
p1=instance_create(x,y,wigglerbod)
with p1
{
atartmove=22
wigglehead=other.id
depth=1
}

p2=instance_create(x,y,wigglerbod)
with p2
{
atartmove=42
wigglehead=other.id
depth=2
}

p3=instance_create(x,y,wigglerbod)
with p3
{
atartmove=62
wigglehead=other.id
depth=3
}

p4=instance_create(x,y,wigglerbod)
with p4
{
atartmove=82
wigglehead=other.id
depth=4
}

anger=0
#define Step_2
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


if anger=1
{

with p1 anger=1 with p2 anger=1 with p3 anger=1 with p4 anger=1

if abs(nearestplayer().x-x)<8
turnx=x

if nearestplayer().x > x+32 {hspeed=1} if nearestplayer().x < x-32 {hspeed=-1}

if nearestplayer().x > x xsc=-1
if nearestplayer().x < x xsc=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)
draw_sprite(dotthing,0,turnx,y)
