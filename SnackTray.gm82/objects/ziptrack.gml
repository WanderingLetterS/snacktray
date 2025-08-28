#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

xdir=unreal(xdir)
spd=unreal(spd)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("ziptrack")

if !place_meeting(x+16,y,ziptrack) ssw_objects("ziptrackl")
if !place_meeting(x-16,y,ziptrack) ssw_objects("ziptrackr")

if spd==0 subframe+=0.25
if spd==1 subframe+=0.50
if spd==2 subframe+=0.10

if (subframe>=1){
    frame= (frame+1) mod 5
    subframe=0
}
