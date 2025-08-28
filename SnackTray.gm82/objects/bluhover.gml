#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=0

xsc=1
type=1
sprite="bluparatroopa"
enemy2=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (abs(nearestplayer().y-y)<16 && instance_exists(player)) {
    spindash+=1
    sprite="blushellwinged"
    if spindash mod 8 =0 {i=shoot(x,y+10,smoke) i.hspeed=sign(nearestplayer().x-x) i.depth=depth+2}
}

if (spindash) {
    xsc = -sign(nearestplayer().x-x)
    spindash+=1
    vspeed=0

    if spindash>60 {
        i=shoot(x,y+10,smoke) i.depth=depth+2
        i=instance_create(x,y,shell)
        i.goblu=1
        i.type="blu"
        i.enemy2=1
        i.powner=powner
        i.kicked=1
        i.spd=max(3,abs(other.hsp)+1)
        i.owner=id
        i.stop=0
        i.phase=owner
        i.hspeed=sign(nearestplayer().x-x)*3
        instance_destroy()
    }
}

if (hp<=-1) {hp=0 hspeed=xsc*-0.5 paramode=1 sprite="blukoopa" instance_change(blukoopa,0)}
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
if (trap) {
    my=y
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    ystart+=y-my
} else {
    s=(s+1) mod 360
    y=ystart+50+round(lengthdir_y(50,s))
}
