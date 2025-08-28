#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
elclaw=instance_create(x,y+128,claw)
elclaw.owner=id
ang2=8
ysc=1
xsc=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
anglething=point_direction(x,y,elclaw.x,elclaw.y)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_background_part_ext(global.masterobjects[biome],384,152,16,16,x-8,y-8,1,1,c_white,1)
draw_background_part_ext(global.masterobjects[biome],384,168,16,16,round(x+lengthdir_x(ang2+2,anglething))-8,round(y+lengthdir_y(ang2+2,anglething))-8,1,1,$ffffff,1)
draw_background_part_ext(global.masterobjects[biome],384,168,16,16,round(x+lengthdir_x(ang2+10,anglething))-8,round(y+lengthdir_y(ang2+10,anglething))-8,1,1,$ffffff,1)
draw_background_part_ext(global.masterobjects[biome],384,168,16,16,round(x+lengthdir_x(ang2+18,anglething))-8,round(y+lengthdir_y(ang2+18,anglething))-8,1,1,$ffffff,1)
draw_background_part_ext(global.masterobjects[biome],384,168,16,16,round(x+lengthdir_x(ang2+26,anglething))-8,round(y+lengthdir_y(ang2+26,anglething))-8,1,1,$ffffff,1)
