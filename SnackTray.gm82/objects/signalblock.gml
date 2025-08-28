#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0;
active=0;
channelid=0;
getregion(x)

mycoll=instance_create(x,y,collider)
mycoll.mask_index=spr_16
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.channel[real(channelid)])
{
    if !(real(inverted))
        active = 1;
    else
        active = 0;
}
else
{
active = real(inverted);
}

if (active)
mycoll.y=-verybignumber
else
mycoll.y=y
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("signalblock")
