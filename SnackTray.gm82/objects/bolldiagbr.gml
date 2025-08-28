#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

cx+=4
cy+=4
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
top=!(position_meeting(x,y-32,bollwall) || position_meeting(x,y-32,bolldiagbr) || position_meeting(x,y-32,bolldiagbl))
bot=!(position_meeting(x,y+32,bollwall) || position_meeting(x,y+32,bolldiagtr) || position_meeting(x,y+32,bolldiagtl))
lef=!(position_meeting(x-32,y,bollwall) || position_meeting(x-32,y,bolldiagbr) || position_meeting(x-32,y,bolldiagtr))
rig=!(position_meeting(x+32,y,bollwall) || position_meeting(x+32,y,bolldiagbl) || position_meeting(x+32,y,bolldiagbr))

floored=0
if (position_meeting(x,y-32,bollfloor) || position_meeting(x-32,y,bollfloor)) {
    instance_create(x,y,bollfloor)
    floored=1
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ftr=(position_meeting(x,y-32,bollfloor) || !top) && (position_meeting(x+32,y,bollfloor) || !rig)
fbl=(position_meeting(x,y+32,bollfloor) || !bot) && (position_meeting(x-32,y,bollfloor) || !lef)
