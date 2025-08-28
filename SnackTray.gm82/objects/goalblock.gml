#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
frame=global.frame
if (hit) frame=4
#define Other_14
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!owner.finish) {
    owner.blocked=myflag
    owner.finish=1
    count+=1
    if (count=global.mplay) {
        instance_create(x,y,finishstar)
        hit=1
    }
}
#define Other_17
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x+8,y-16,flag)
i.ystart-=122
i.isblock=1
i.no1up=1
i.nextlevel=nextlevel
i.endstagex=0
i.visible=0

myflag=i
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_tile("goalblock")
