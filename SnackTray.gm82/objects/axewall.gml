#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
breaking=1

if (tendency=1) {
    p=instance_position(x+8,y-8,axewall)
    if (p) if (!p.breaking) {depth=3 vspeed=-spd tendency=1 alarm[1]=arm exit}
}
if (tendency=2) {
    p=instance_position(x+24,y+8,axewall)
    if (p) if (!p.breaking) {depth=3 hspeed=spd tendency=2 alarm[1]=arm exit}
}
if (tendency=3) {
    p=instance_position(x-8,y+8,axewall)
    if (p) if (!p.breaking) {depth=3 hspeed=-spd tendency=3 alarm[1]=arm exit}
}
if (tendency=4) {
    p=instance_position(x+8,y+24,axewall)
    if (p) if (!p.breaking) {depth=3 vspeed=spd tendency=4 alarm[1]=arm exit}
}

p=instance_position(x+8,y-8,axewall)
if (p) if (!p.breaking) {depth=3 vspeed=-spd tendency=1 alarm[1]=arm exit}
p=instance_position(x+24,y+8,axewall)
if (p) if (!p.breaking) {depth=3 hspeed=spd tendency=2 alarm[1]=arm exit}
p=instance_position(x-8,y+8,axewall)
if (p) if (!p.breaking) {depth=3 hspeed=-spd tendency=3 alarm[1]=arm exit}
p=instance_position(x+8,y+24,axewall)
if (p) if (!p.breaking) {depth=3 vspeed=spd tendency=4 alarm[1]=arm exit}

sound("enemykill")
instance_create(x+8,y+8,smoke)
instance_destroy()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
p.tendency=tendency
p.alarm[0]=1
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tendency=0

spd=2
if (type="1") spd=1
if (type="2") spd=4

arm=16/spd
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_tile("axewall")
