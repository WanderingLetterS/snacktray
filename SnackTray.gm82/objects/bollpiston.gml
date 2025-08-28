#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
extendo=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
extendo=0
sound("specialpiston2")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (extendo) z=min(16,z+2)
else z=max(0,z-2)
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

ftl=(position_meeting(x,y-32,bollfloor) || !top) && (position_meeting(x-32,y,bollfloor) || !lef)
ftr=(position_meeting(x,y-32,bollfloor) || !top) && (position_meeting(x+32,y,bollfloor) || !rig)
fbl=(position_meeting(x,y+32,bollfloor) || !bot) && (position_meeting(x-32,y,bollfloor) || !lef)
fbr=(position_meeting(x,y+32,bollfloor) || !bot) && (position_meeting(x+32,y,bollfloor) || !rig)
