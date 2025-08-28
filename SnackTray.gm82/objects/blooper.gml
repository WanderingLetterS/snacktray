#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
state="falling"

xsc=1
frame=0
seq=48
vspeed=0.5
active=1

sprite="blooper"
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inview()) {x-=hspeed y-=vspeed exit}

animated=0

if (trap) {
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    x-=hspeed
    y-=vspeed
} else {
    t=instance_nearest(x,y,player)
    if (y<32) {
        hspeed=0
        vspeed=0.5
        state="falling"
        seq=0
    }

    seq+=1
    if (state="falling") {
        frame=1
        if (y>t.y-24 && abs(x-t.x)<32 || y>176) seq+=4
        if (seq>=64) {
            if (y<t.y-32) seq=20
            else {
                state="flying"
                seq=0
                vspeed=-1
                if (view_xview[t.p2]>xstart) hspeed=esign(xstart-x,1)
                else hspeed=esign(t.x-x,1)
                xsc=esign(-hspeed,1)
            }
        }
    }
    if (state="flying") {
        frame=0
        if (seq=8) {hspeed*=2 vspeed*=2}
        if (seq=12 && sign(hspeed)!=sign(t.x-x) && myrand(1)>0.7) hspeed*=-1
        if (seq=16) {hspeed/=2 vspeed/=2}
        if (seq=24) {
            state="falling"
            hspeed=0
            vspeed=0.5
            if (t.y<y+32) seq=11
            else seq=0
        }
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=parent override
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
ssw_enemy(sprite)
