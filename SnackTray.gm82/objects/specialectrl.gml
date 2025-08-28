#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cur=2

pal[i]="S" i+=1
pal[i]="#" i+=1
pal[i]=" " i+=1
pal[i]="´" i+=1
pal[i]="`" i+=1
pal[i]="\" i+=1
pal[i]="/" i+=1
pal[i]="O" i+=1
pal[i]="." i+=1
pal[i]=":" i+=1
pal[i]="t" i+=1
pal[i]="%" i+=1
pal[i]="@" i+=1
pal[i]="!" i+=1
pal[i]="b" i+=1
pal[i]="B" i+=1
pal[i]="1" i+=1
pal[i]="2" i+=1
pal[i]="3" i+=1
pal[i]="F" i+=1
pal[i]="T" i+=1

check[0]=0
check[0]=0
check[0]=0

time=30

instance_create(0,0,specialecur)
instance_create(0,0,specialeghost)
instance_create(0,0,specialehud)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (specialemenu) visible=1
with (specialehud) visible=1
with (specialecheck) visible=1
with (specialepal) visible=1
with (specialecur) visible=1
with (specialeobj) visible=1
with (specialeghost) visible=1

FMODAllStop()
windowhandler()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cur=modulo(cur+mouse_wheel_down()-mouse_wheel_up(),0,21)

if (keyboard_check_pressed(vk_f5) && !instance_exists(moranboll)) specialetest()
if (keyboard_check_pressed(ord("S")) && keyboard_check(vk_control) && workingfn!="") specialesave(workingfn)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var p,i;

p=ds_priority_create()
i=0

with (specialepal) {
    i+=1
    ds_priority_add(p,id,x+1000*y)
}

while (i) with (ds_priority_delete_max(p)) {
    i-=1
    type=i
}

ds_priority_destroy(p)

specialenew(1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_clear($ff8040)
if (!instance_exists(moranboll)) for (i=0;i<32;i+=1) for (j=0;j<32;j+=1) {
    draw_sprite_ext(spr_specialegrid,0,i*64-16,j*64-16,32,32,0,$ffffff,1)
}
