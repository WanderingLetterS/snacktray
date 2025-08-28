#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oxc=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (gamemanager.timedead) exit

xc=x
view=-1
for (i=0;i<global.mplay;i+=1) if (region=gamemanager.players[i].region && gamemanager.players[i].x>xc && gamemanager.players[i].x<maxx) {
    xc=gamemanager.players[i].x
    view=i
}
if (view!=-1) {
    bc+=1+max(0,xc-oxc)
    oxc=xc
    if (bc>=256) {bc=0
        with (instance_create(view_xview[view]+view_wview[view]+16,view_yview[view]+56+floor(myrand(9))*16,bulletbill)) {
            hspeed=-2
            xsc=1
        }
        sound("enemycannon")
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
maxx=verybignumber with (spawncancel) if (x>other.x && y=other.y) other.maxx=min(x,other.maxx)
