#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
edgetile = "On"
getregion(x)
beltspd=2
frame=0
frs=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if xsc=1
{
frs+=-beltspd
if frs>5 || frs=5
{
frs=0
if frame!=3
frame+=1
else
frame=0
}
}
if xsc=-1
{
frs+=beltspd
if frs>5 || frs=5
{
frs=0
if frame!=3
frame+=1
else
frame=0
}
}
xsc=-1*sign(beltspd)
beltspd=unreal(beltspd)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//draw_self()
if edgetile = "0"
{
if place_meeting(x-1,y,conveyorbelt) && place_meeting(x+1,y,conveyorbelt)
{
ssw_objects("conveyorbeltcenter")
}
else if !place_meeting(x-1,y,conveyorbelt) && place_meeting(x+1,y,conveyorbelt)
{
if xsc=-1
ssw_objects("conveyorbeltleft")
else
ssw_objects("conveyorbeltright")
}
else if place_meeting(x-1,y,conveyorbelt) && !place_meeting(x+1,y,conveyorbelt)
{
if xsc=-1
ssw_objects("conveyorbeltright")
else
ssw_objects("conveyorbeltleft")
}
else if !place_meeting(x-1,y,conveyorbelt) && !place_meeting(x+1,y,conveyorbelt)
{
ssw_objects("conveyorbeltcenter")
}
}
else
{
ssw_objects("conveyorbeltcenter")
}
