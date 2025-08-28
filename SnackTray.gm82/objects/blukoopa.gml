#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=-0.75
xsc=1
type=0
sprite="blukoopa"
walking=1
enemy2=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (abs(nearestplayer().y-y)<8 && instance_exists(player) && grounded) {
 spindash+=1
 sprite="blushellspin"
 if spindash mod 8 =0 {i=shoot(x,y+10,smoke) i.hspeed=sign(nearestplayer().x-x) i.depth=depth+2}
}
if grounded && abs(hspeed<0.75) && !spindash {hspeed=sign(-xsc)*0.75}
if walking && spindash{
    xsc = -sign(nearestplayer().x-x)
    hspeed=0
    spindash+=1
    walking=0
} else if spindash{
    spindash+=1
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

if (hp<=-2) {
    sound("enemystomp")
    with (instance_create(x,y,shell)) {type="blu" enemy2=1 powner=other.powner}
    if (powner) powner.items+=1
    instance_destroy()
}
