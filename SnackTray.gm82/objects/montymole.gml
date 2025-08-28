#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=0
enemy2=1
sprite="montymole"
pop=0

if type=1 {instance_create(x,y,montyhole) instance_destroy()}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trap) {
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    x-=hspeed
    y-=vspeed
} else if (active) {
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
            vspeed=choose(0,0,0,0,0,0,-2,-1,0,0,0,0,0,)
            if pop
            pop=0
            if (hsp!=0) vspeed=-abs(hsp)
            y=floor(y)
            y=yground-(bbox_bottom+1-y)
            if (object_index=hopkoopa) vspeed=-2.75
            redturn=1
        } else {
            if ((brat || (object_index=redkoopa && !paramode)) && redturn) {
                redturn=0 hspeed*=-1 x+=hspeed
            }
            vspeed=min(3,vspeed+grav)
        }
    }
    turnaround()
}

//if distance_to_object(player) < 80 && go=0 {go=2 vspeed=-3} if go=2 {hspeed=0 if yground && vspeed > 0 { hspeed=0 go=1}} if go=1
if !pop
{
sprite="montymole"
if nearestplayer().x > x {hspeed+=0.0159} if nearestplayer().x < x {hspeed-=0.0159} if hspeed > 1.8 hspeed=1.8 if hspeed < -1.8 hspeed=-1.8
}

if nearestplayer().x > x xsc=-1
if nearestplayer().x < x xsc=1

if type="1" {instance_create(x,y,montyhole) instance_destroy()}
