#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=181
k=0

mytext="1.4.3, The left border."


switch(random(10)){
    case 0: mytext="Still using old engine!" break;
    case 1: mytext="Go play Boll 2!#(When its out...)" break;
    case 2: mytext="Go play Boll 2!#(When its out...)" break;
    case 3: mytext="Beware: Very early release!" break;
    case 4: mytext="Beware: Very early release!" break;
    case 5: mytext="Beware: Very early release!" break;
    case 6: mytext="Beware: Very early release!" break;
    case 7: mytext="Beware: Very early release!" break;
    case 8: mytext="Beware: Very early release!" break;
    case 9: mytext="WAP: Very early release!" break;
    case 10: mytext="Still using old engine!" break;

}
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
if introtape.f20=1
if (visible) {
    d3d_set_projection_ortho(0,0,global.screenwidth,global.screenheight,0)
    s=0.5+0.02*abs(sin(k)/2)
    k+=0.1
    d3d_transform_add_scaling(s*2,s*2,1)
    d3d_transform_add_rotation_z(30)
    d3d_transform_add_translation(global.screenwidth/2+80,y+50,0)
    global.halign=1
    draw_omitext(0,0,mytext,$ffff)
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
