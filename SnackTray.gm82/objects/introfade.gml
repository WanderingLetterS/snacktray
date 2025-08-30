#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=global.screenwidth
image_yscale=global.screenheight
image_blend=0
alarm[0]=180
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_blend=$ffffff
if (!instance_exists(blastprocessor)) introctrl.cango=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_blend=$ffffff) image_alpha=max(0,image_alpha-0.05)
if (image_alpha=0) instance_destroy()
