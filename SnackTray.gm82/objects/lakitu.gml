#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=-1
ysc=1
hsp=0
count=0
throwcount=0
active=1
respawned=0

maxx=verybignumber with (spawncancel) if (x>other.x && y=other.y-8) other.maxx=min(x,other.maxx)
getregion(x)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
respawned=0 event_user(0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var l,r;
if (respawned) exit

if (trap) {
    x=(x*4+trap.x)/5
    y=(y*4+trap.y)/5
    flipc-=1
    if (!flipc) {xsc*=-1 flipc=24}
    x-=hspeed
    y-=vspeed
} else {
    //find out the x of the winning player and store that in vm
    vm=0
    succ=0
    xc=xstart
    for (i=0;i<global.mplay;i+=1) if (region=gamemanager.players[i].region && gamemanager.players[i].x>xc && gamemanager.players[i].x<maxx) {
        vm=gamemanager.players[i].x
        view=i
        succ=1
    }

    if (vm>maxx) succ=0
    if (vm=0) flee=1
    {
        //count to 32 then update speed
        count+=1 if (count=32) {
            count=0
            if (abs(vm-x)>64) hsp=sign(vm-x)*2
            else {
                if (abs(vm-x)>24) hsp+=sign(vm-x)*1.5
                else hsp+=sign(hsp)*1.5
                if (abs(hsp)<1) hsp=sign(vm-x)*2
            }
        }

        //if out of range, slowly move away
        if (!succ) {hsp=-2 flee=1}
        //else if (gamemanager.players[view].x<xstart) {hsp=2 flee=1}
        else flee=0
    }

    if (flee) {
        vspeed-=0.05
        if (y<=-100) {y=-100 vspeed=0 active=0}
    } else {
        active=1
        if (y+vspeed>=ystart) {y=ystart vspeed=0}
        else {
            vspeed+=0.1
            if (y>ystart-32) vspeed=max(1,vspeed-0.2)
        }
    }


    //update internal positioning control
    hsp=median(-4,hsp,4)
    rx=median(-24,rx+hsp/3,424)

    //avoid camera shimming desyncs
    with gamemanager.players[view] {
        with (regionmarker) {
            if (lefthand<other.x) l=max(lefthand,view_xview[other.p2])
            if (x>other.x) r=min(x,other.x+224)
        }
    }
    xgo=median(l,gamemanager.players[view].x-200+rx,r)
    xsc=esign(x-vm,1)
    x+=median(-4,xgo-x,4)

    //update throw counter and spawn spiny
    if (rx=median(16,rx,400-16) && !flee && !plr.spindash) throwcount+=1
    if (instance_number(spiny)+instance_number(spinyegg)<3+instance_number(spinyeggwater)<3) {
        if (throwcount>128) {
            throwcount=0
            if !underwater()
            with (instance_create(x,y-8,spinyegg)) {hspeed=other.x-other.xprevious}
            else
            with (instance_create(x,y-8,spinyeggwater)) {hspeed=other.x-other.xprevious vspeed=3}
        }
    }
}

if (throwcount>112) sprite="lakituaim"
else sprite="lakitu"
animated=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vm=0
maxx=verybignumber with (spawncancel) if (x>other.x && y=other.y-8) other.maxx=min(x,other.maxx)
getregion(x)
for (i=0;i<global.mplay;i+=1) {
    p=gamemanager.players[i]
    if (p.x>vm && region=p.region && !flag.passed[i]) vm=p.x
}

//x=vm+280
y=-100

rx=280

hp=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !animated {enemy_spritechange()

enemy_animate() animated=1}
if (!respawned) ssw_enemy(sprite)
if global.debug draw_self()
