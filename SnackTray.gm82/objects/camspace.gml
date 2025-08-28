#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=-verybignumber
alarm[0]=2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=ystart
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,ystart,player)) {
    y=-verybignumber
    alarm[0]=2
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
top=0
right=1
left=1
bottom=0

image_blend=$ff00
image_xscale=(view_wview[0]/16)
image_yscale=14
