#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)

getregion(x)
sheet=global.bosssheet[biome]
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30

if (!inview()) {hspeed=0 exit}

xsc=esign(x-player.x)
if (player.x>x+32) hspeed=1
if (x<xstart-32) hspeed=0.5
y-=4

hspeed=rchoose(-0.5,0.5)
visible=(myrand(1)>0.1)
if (myrand(1)>0.2) {y+=12 xsc=!xsc}
if (myrand(1)>0.5) with (instance_create(x,y-8,hammer)) {xsc=other.xsc hspeed=-xsc}

frame=choose(0,1,2.2,3,6.15,2.7,5,7,3.77)

if (y<0) y=208
if (y>208) y=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !inview() exit

if (global.frame8 && !cooldown && irandom(32)=3) {
    im_the_bad_code=irandom_range(25,60)
    cooldown=260
    sound("systemcodeblockfail",0,random_range(0.975,1.025),0.4)
}
cooldown-=1

if (im_the_bad_code) {
    im_the_bad_code-=1
    draw_self()
}
else {
    draw_sprite_part_ext(sheet,0,frame*60+8,/*60+*/128,59,59,floor(x-30*xsc),floor(y-35+dy),xsc,1,$ffffff,1)
}
