#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=120
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!collision(x+sign(hsp)*16,y+sign(vsp)*16) && !place_meeting(x+sign(hsp)*16,y+sign(vsp)*16,content)) {
    items+=1
    if (items=maxitem) instance_destroy()
    with (instance_create(x,y,pipeitem)) {
        hspeed=other.hsp
        vspeed=other.vsp
        powner=other.id
        content=other.content
        enem=other.enem
        object=other.object
        sprite=other.sprite
        enemy2=other.enemy2
        if (enem) xsc=esign(-hspeed,esign(x-nearestplayer().x,1)) else xsc=esign(-hspeed,esign(nearestplayer().x-x,-1))
        if (content=spring || content=spreng) {x-=8 y-=8}
        if content=sprong target=other.target
    }
}
alarm[0]=120
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview()) alarm[0]=120
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
com_contenttoobject()
maxitem=unreal(maxitem,4)
