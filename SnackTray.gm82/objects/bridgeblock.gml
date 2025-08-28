#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type="bridge"
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_position(x-8,y+8,bridgeblock)) alarm[0]=4

sound("itembridgebreak")
i=instance_create(x,y,bridgepart) i.alarm[1]=4
i=instance_create(x+4,y,bridgepart) i.alarm[1]=3
i=instance_create(x+8,y,bridgepart) i.alarm[1]=2
i=instance_create(x+12,y,bridgepart) i.alarm[1]=1

screenshake(x,2)

with (instance_place(x,y-16,bowserboss)) panic=1

alarm[1]=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=32

panicbowsers()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_tile(type)
