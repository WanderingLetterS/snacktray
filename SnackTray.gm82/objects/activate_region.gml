#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
width=""
height=""
imwrapper=2
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=unreal(width,1)
image_yscale=unreal(height,1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lemontest || global.debug) {
    rect(x,y,(image_xscale*16),(image_yscale*16),c_navy,0.2)
}
