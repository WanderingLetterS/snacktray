#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
drawregion.alarm[0]=2
with (instance_place(x,y,objcontainer)) instance_destroy()
with (instance_place(x,y,semicontainer)) instance_destroy()
with (instance_place(x,y,backcontainer)) instance_destroy()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((position_meeting(x-1,y,objcontainer) || (position_meeting(x-1,y,semicontainer)) || (position_meeting(x-1,y,backcontainer))) && !position_meeting(x-1,y,editflood2)) instance_create(x-1,y,editflood2)
if ((position_meeting(x+1,y,objcontainer) || (position_meeting(x+1,y,semicontainer)) || (position_meeting(x+1,y,backcontainer))) && !position_meeting(x+1,y,editflood2)) instance_create(x+1,y,editflood2)
if ((position_meeting(x,y-1,objcontainer) || (position_meeting(x,y-1,semicontainer)) || (position_meeting(x,y-1,backcontainer))) && !position_meeting(x,y-1,editflood2)) instance_create(x,y-1,editflood2)
if ((position_meeting(x,y+1,objcontainer) || (position_meeting(x,y+1,semicontainer)) || (position_meeting(x,y+1,backcontainer))) && !position_meeting(x,y+1,editflood2)) instance_create(x,y+1,editflood2)

if (editcursor.rightflood) instance_destroy()
