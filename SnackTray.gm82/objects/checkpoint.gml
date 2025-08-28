#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ring=skindat("chkrng")

redcount=0
open=0
spent=0
h=""
k=0
t=0
t2=0
tee=0

bonus=1
classic=0
im_a_spawnster=0

cid=string(x)+"."+string(y)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (redcoin) {
    if !nvm {
    instance_create(x,y,smoke)
    y=-verybignumber
    active=0
    gamemanager.redcount=0
    } else nvm=0
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (redcoin) if !nvm flash=1
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
open=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var save; save=0
if (!instance_exists(bollgate)) with (player) {
    if (abs((x-8)-other.x)<8 && (abs(y-(other.y-16))<24 || other.classic) && !other.passed) if (other.x=median(gamemanager.origin[p2],other.x,gamemanager.righthand[p2])) {
        if (!other.visible) {
            if (global.gamemode="classic") global.check=other.cid
        } else {
            if (global.gamemode="classic") {global.check=other.cid with (checkpoint) passed=0}
            other.passed=1
            coll=id
            with (other) if (inview()) {sound("itemcheck") alarm[3]=300 if (bonus) {if !prevpassed {open=1 with (other) doscore_p(2000,1) prevpassed=1}}}
        }
        if (global.wanna) save=1
    }
    if (!other.spent && other.k>0.2 && abs((x-8)-other.x)<16 && abs(y-(other.y-32))<8) with (other) {
        //now we check what to do here
        spent=1
        alarm[3]=-1
        open=0
        throwsparks(x+8,y-32)
        sound("itemspecial")
        if (!global.shards) { //1.9.1 had no special stages #Fail
            //red coins
            with (redcoin) if (y==ystart) {nvm=1} //i am so terribly sorry for this
            with (redcoin) {powerup=other.powerup  y=ystart active=1 flash=0 visible=1 instance_create(x,y,smoke)}
            alarm[0]=768
            alarm[1]=640
        } else {
            instance_create(x+8,y,bollgate) //secret feature! 1.9.1 accidentally let you collect two boll shards so i'm adding 2 special stages from checkpoints fire emoji
            global.shards-=1
        }
    }
}

if (!position_meeting(x+8,y+24,collider) || flyin<-1) && inview() {
    tee+=0.25              
    flyin=round(sin(tee/2)*2-3)
    flyinsparkles=round(sin((tee+2)/2)*2-3)
} else if flyin=-1{
    flyin=0
    flyinsparkles=0
}
if (open && !spent) k=min(1,k+0.01)
else k=max(0,k-0.01)

if (k>0 && !spent) {
    if (ring) t+=0.1
    else t+=1   
    t2+=0.25 
    frame=floor(t2 mod 7)
}

if (save) {
    open=0
    savekidcheckpoint()
    if (bonus) open=1
}

if (player.region != region && im_a_spawnster) {
    im_a_spawnster=0
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (func!="0" && func!="") bonus=0
if (func="2") classic=1

getregion(x)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=(flyin + (1 * (flyin != 0)))

draw_background_part(global.masterobjects[biome],8+36*global.frame,328+44*passed,36,44,x-7,y-28)

if (global.frame8!=prevf && flyin<0) with instance_create(x + 1 + round(((-flyin)*3.2)),y+16-flyin+flyinsparkles,fireworkeff) fast=0.75
prevf=global.frame8

if (k>0) {
    if (ring) {
        c=0
        for (i=0;i<pi*2;i+=pi/4) {
            if (cos(t+i)<0.5) {
                draw_sprite_part(global.effectssheet[biome],0,158,158+25*median(0,round(1+cos(t+i)),2),24,24,round(x-4+24*sin(t+i)*k),round(y-12-32+4*sin(t*1.53+i)*k))
            }
            c+=1
        }

        if (global.shards) {
            xp=x yp=y
            x+=8 + ((global.shards>=2) * 6)
            y-=32
            flip=0
            ssw_items("shard")
            if (global.shards>=2) {
                flip=1
                x-=12
                ssw_items("shard")
            }
            x=xp y=yp
        }
        c=0
        for (i=0;i<pi*2;i+=pi/4) {
            if (cos(t+i)>=0.5) {
                draw_sprite_part(global.effectssheet[biome],0,158,158+25*median(0,round(1+cos(t+i)),2),24,24,round(x-4+24*sin(t+i)*k),round(y-12-32+4*sin(t*1.53+i)*k))
            }
            c+=1
        }

    } else {
        if (open || !(t mod 5<3)) {

            if (global.shards) {
                xp=x yp=y
                x+=8 + ((global.shards>=2) * 10)
                y-=32
                flip=0
                ssw_items("shard")
                if (global.shards>=2) {
                    flip=1
                    x-=20
                    ssw_items("shard")
                }
                x=xp y=yp
            } else draw_sprite_part(global.effectssheet[biome],0,158,158+25*median(0,round(1+cos(t+i)),2),24,24,x-4,y-44)
        }
    }
}
y-=(flyin + (1 * (flyin != 0)))
