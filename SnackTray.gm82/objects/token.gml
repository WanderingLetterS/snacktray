#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0
c=0

xp=x
yp=y
type=0
persistence="0"
pack = global.lskins[global.levelskin+1,0]
if (pack == global.lbase) pack = ""
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=0.25
frame=floor(t mod 7)
dy=round(sin(x+t/2)*2-3)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (gibtoken(other)) {
    spendblock()
    instance_destroy()
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type=unreal(persistence,0)
switch type {
    case 1:
        if spentblock() { //temporary (last for entire current run)
            instance_destroy()
        }
        break;
    case 2:
        if global.lemontest break;
        if settings("token " + name + " " + chr(187) + pack) { //permanent (save file)
            instance_destroy()
        }
        break;
    default:
        if spentblock() { //temporary (carry over through death)
            changectrl.tokens+=1
            instance_destroy()
        }
        type=0
        break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_items("token")
