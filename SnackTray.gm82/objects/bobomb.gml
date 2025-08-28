#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

hspeed=-0.5
enemy2=1
sprite="bob-omb"
IM_LIT=0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(powner) powner.items-=1
soundstop("enemybombfuse")
soundstop("enemybombwarn")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y,firebar)
|| place_meeting(x,y,orbifireball)
|| place_meeting(x,y,podoboo)
|| place_meeting(x,y,firemissile)
|| place_meeting(x,y,fireballplant)
|| place_meeting(x,y,fireball)
|| place_meeting(x,y,firemissilesmall) {
    event_user(5);
}

if (active && IM_LIT) {
    explode_timer-=1
    warn_timer-=1
    if (!explode_timer) {
        instance_create(x,y-(16*grounded),bigBOM)
        sound("enemybigexplode")
        instance_destroy();
    }
    if (!warn_timer && warn_timer > -200) {
        sound("enemybombwarn")
        warn_timer = -200
    }
}
#define Other_15
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if IM_LIT || !active exit
IM_LIT=1
sprite="bob-omblit"
hspeed=1*(-xsc)
explode_timer=60*5 //explosion timer
warn_timer=60*2 //warn timer
sound("enemybombfuse")
