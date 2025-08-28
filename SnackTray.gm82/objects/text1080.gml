#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=181
k=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    d3d_set_projection_ortho(0,0,400,224,0)
    s=0.5+0.02*abs(sin(k))
    k+=0.1
    d3d_transform_add_scaling(s,s,1)
    d3d_transform_add_rotation_z(30)
    d3d_transform_add_translation(x,y,0)
    global.halign=1
    draw_omitext(0,0,"This text is hard to read if you play the game at the default resolution, but at 1080p it's fine!",$ffff)
    global.halign=0
    d3d_transform_set_identity()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
