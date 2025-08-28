#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xc=x+8
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (gamemanager.timedead) exit

var yeans;

p=nearestplayer()
if (p) {
    p=sign(p.x-xc)
    if (!position_meeting(xc+16*p,y,collider)) {
        yeans=global.mplay*2
        with (bullseyebill) if (y=other.y+8) yeans-=1
        if (yeans) {
            instance_create(xc,y+12,bullseyebill)
            instance_create(xc+8*p,y+8,smoke)
            sound("enemycannonfast")
        }
    }
}

alarm[0]=rchoose(120,150,180,210,240)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview() || abs(instance_nearest(xc,y,player).x-xc)<24 || flag.trig) alarm[0]=60+(xc*y mod 60)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

q=0
do {
    tile_bake(global.masterobjects[biome],232,96+q,16,16,x,y,1000000+q/16)
    q=min(32,q+16)
    y+=16
} until (position_meeting(x+8,y+8,ground) || position_meeting(x+8,y+8,phaser) || (q=32 && position_meeting(x+8,y-24,redcannon)) || y>=region.ky+16)
keky=y

y=ystart
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !place_meeting(x,ystart,ground)with (instance_create(x,ystart,ground)) image_yscale=(other.keky-other.ystart)/16
