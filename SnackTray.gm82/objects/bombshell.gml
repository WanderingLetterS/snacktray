#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

alarm[1]=100
xsc=1
flip=0
carry=0
spd=0
kickup=0
eita=0
active=1
frspd=0
enemy2=1

getregion(x)

sprite="bombshell"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
instance_create(x,y,BOM)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=60
frspd=2
