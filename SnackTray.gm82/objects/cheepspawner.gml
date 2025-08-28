#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
count=100
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i,xc;

if (gamemanager.timedead) exit

if (water) {
    if (!flag.yup) {
        view=-1
        xc=x
        for (i=0;i<global.mplay;i+=1) if (region=gamemanager.players[i].region && gamemanager.players[i].x>xc && gamemanager.players[i].x<maxx) {
            xc=gamemanager.players[i].x
            view=i
        }
        if (view!=-1) {
            bc+=1+max(0,xc-oxc)
            oxc=xc
            if (bc>=64 && instance_number(cheepred)+instance_number(cheepwhite)<6) {bc=0
                instance_create(view_xview[view]+view_wview[view]+16,56+floor(myrand(9))*16,rchoose(cheepwhite,cheepred))
            }
        }
    }
} else {
    count-=1 if (count<=0) {
        count=40-global.mplay*5
        p=(p+1) mod global.mplay
        if (!(gamemanager.players[p].piped && gamemanager.players[p].sprongin)) {
            if (myrand(1)>0.2 && region=gamemanager.players[p].region && gamemanager.players[p].x>x && gamemanager.players[p].x<maxx && gamemanager.players[p].y>y-245) {
                with (instance_create(view_xview[p]+32+myrand(view_wview[p]-64)+gamemanager.players[p].hsp*20,view_yview+248,cheepfly)) {event_user(0)}
            }
        }
    }
    xvp[0]=view_xview[0]
    xvp[1]=view_xview[1]
    xvp[2]=view_xview[2]
    xvp[3]=view_xview[3]
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
maxx=verybignumber with (spawncancel) if (x>other.x && y=other.y) other.maxx=min(x,other.maxx)
getregion(x)
if (getbiomename(biome)="Underwater") water=1
