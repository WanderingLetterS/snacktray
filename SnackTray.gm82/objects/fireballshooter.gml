#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30;
shot=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if real(channelid) exit;

switch (real(dir)) {
    case 0: instance_create(x+8,y+8,smoke) with(instance_create(x,y+4,firemissilesmall)) {hspeed=2 xsc=1 ver=0} break;
    case 1: instance_create(x+8,y+8,smoke) with(instance_create(x,y+4,firemissilesmall)) {hspeed=-2 xsc=-1 ver=0} break;
    case 2: instance_create(x+8,y+8,smoke) with(instance_create(x+4,y+12,firemissilesmall)) {vspeed=-2 hspeed=0 ysc=1 ver=1 image_angle=90} break;
    case 3: instance_create(x+8,y+8,smoke) with(instance_create(x+4,y+16,firemissilesmall)) {vspeed=2 hspeed=0 ysc=-1 ver=1 image_angle=90} break;
}

alarm[0]=90;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (real(channelid) && global.channel[real(channelid)]) && !(shot) {
    shot=1
    switch (real(dir)) {
    case 0: instance_create(x+8,y+8,smoke) with(instance_create(x,y+4,firemissilesmall)) {hspeed=2 xsc=1 ver=0} break;
    case 1: instance_create(x+8,y+8,smoke) with(instance_create(x,y+4,firemissilesmall)) {hspeed=-2 xsc=-1 ver=0} break;
    case 2: instance_create(x+8,y+8,smoke) with(instance_create(x+4,y+12,firemissilesmall)) {vspeed=-2 hspeed=0 ysc=1 ver=1 image_angle=90} break;
    case 3: instance_create(x+8,y+8,smoke) with(instance_create(x+4,y+16,firemissilesmall)) {vspeed=2 hspeed=0 ysc=-1 ver=1 image_angle=90} break;
    }
} else if !(global.channel[real(channelid)]) {
    shot=0
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

switch(real(dir)) {
    case 0: tile_bake(global.masterobjects[biome],472,568,8,16,x,y,1) break;
    case 1: tile_bake(global.masterobjects[biome],464,568,8,16,x+8,y,1) break;
    case 2: tile_bake(global.masterobjects[biome],448,568,16,8,x,y+8,1) break;
    case 3: tile_bake(global.masterobjects[biome],448,576,16,8,x,y,1) break;
}
