#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
friction=0.1
drop=0
lok=0
fresh=1

getregion(x)
xgo=x
nextlevel=""
name=""
frame=0
open=0
fc=0
flash=0
key=0
instant=0 //I dont feel like dealign with that rn

pack = global.lskins[global.levelskin+1,0]
if (pack == global.lbase) pack = ""
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (key>=1) {
    over=1
    alarm[1]=2

    if locktype=="key" {
        with (other) {
            if count_owned(keyfollow) {
                 o=follower
                 while (o.follower) o=o.follower
                 if (o) with (o) {follow.follower=noone instance_destroy() instance_create(x,y,smoke)}
                other.key=0
            }
        }
    }
    else if (locktype == "token" && gamemanager.tokens) {gamemanager.tokens-=key key=0}
    else if (locktype == "tokenblue" && global.tokens) {global.tokens-=key spendtoken() key=0}
    else if (locktype == "tokengreen" && settings("token " + name + " " + chr(187) + pack)) {settings("token " + name + " " + chr(187) + pack,2) key=0}
}
if other.piped exit
if oncooldown || spit || key  exit

if !t exit


event_user(1)

depth=other.depth-1
with other {
    set_sprite("roll")
    piped=1
    pipeid=other.id
    pipe=1
    visible=0
}
hit=1
t.hit=1
t.oncooldown=60
sound("itemwarpboxenter")
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
key=unreal(key,0);
instant=unreal(instant,0);
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    with (instance_create(x+4,y-4,smoke)) {direction=135 speed=2 friction=0.1}
    with (instance_create(x+12,y-4,smoke)) {direction=45 speed=2 friction=0.1}
    with (instance_create(x+4,y+4,smoke)) {direction=225 speed=2 friction=0.1}
    with (instance_create(x+12,y+4,smoke)) {direction=315 speed=2 friction=0.1}
sound("itemwarpboxexit")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hit {
    yes+=0.2
    if yes>2 {yes=2 oncooldown=60}
}
oncooldown=max(oncooldown-1,0) //assuming this should happen now since they arent pt secrets in vanilla??? idk maybe i'll make it a lemon option
if spit{
    hit=0
    yes=max(yes-0.2,0)
    if yes<=0{
         oncooldown=60
        spit=0 
        depth=1000000 
        
    }
}
frame=floor(yes)
if (global.debug) draw_self()
key=unreal(key,0)
if !calcspend {calcspend=1 if locktype=="tokenblue" key-=spenttoken()}

global.halign=1
if (abs(player.x-xstart)<=48 && abs(player.y-ystart)<=48 && key && locktype=="tokengreen") {
    if !settings("token " + name + " " + chr(187) + pack) col=$808080 else col=$ffffff
    draw_skintext(x,y-20,name,col,1)
} else if locktype=="tokengreen" {
    if settings("token " + name + " " + chr(187) + pack) == 2 key=0
}
global.halign=0

ssw_tile("warpbox")
