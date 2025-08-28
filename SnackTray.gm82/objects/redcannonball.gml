#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
active=1
damage_player_on_contact=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch dir
{
case "up":  hspeed=0 vspeed=-3 break;
case "down":  hspeed=0 vspeed=3 break;
case "left":  hspeed=-3 vspeed=0 break;
case "right":  hspeed=3 vspeed=0 break;
case "upleft":  hspeed=-1.5 vspeed=-1.5 break;
case "upright":  hspeed=1.5 vspeed=-1.5 break;
case "downleft":  hspeed=-1.5 vspeed=1.5 break;
case "downright":  hspeed=1.5 vspeed=1.5 break;
}

if (!lone) {
    minx=verybignumber
    maxx=0

    for (i=0;i<global.mplay;i+=1) {
        maxx=max(maxx,view_xview[i]+view_wview[i]+48)
        minx=min(minx,view_xview[i]-48)
    }

    if (x<minx || x>maxx) instance_destroy()
    if (abs(x-xstart)>16) depth=0
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_background_part_ext(global.masterobjects[biome],280,32,16,16,round(x-8),round(y-8),image_xscale,image_yscale,c_white,image_alpha)
