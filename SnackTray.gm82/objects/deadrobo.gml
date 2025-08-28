#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=0.2
alarm[0]=30
alarm[1]=60

frame=0
name="robo"
sprite="dead"
jump=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dest=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
coll=collision(0,0)
if (coll && vspeed>0 && jump) {
    jump=0
    y=coll.y-14
    speed=0
    gravity=0
    playsfx("robostomp")
}
if (dest) {c+=1 visible=(c mod 5>2) if (c>30) instance_destroy()}

if (!irandom(5)) if (owner.water) instance_create(x+irandom_range(-16,16),y+irandom_range(-16,24),airbubble)
if (!irandom(10)) {playsfx("robosplode") with (instance_create(x+irandom_range(-16,16),y+irandom_range(-16,16),dethplotion)) owner=other.owner}
if (!irandom(30)) playsfx("robosplode")
