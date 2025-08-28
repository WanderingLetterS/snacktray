#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

waking=0
alarm[0]=10
alarm[1]=300
xsc=1
flip=0
carry=0
spd=2
kickup=0
eita=0
active=1
frspd=1

type=0
getregion(x)

type=""
sub="shell"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
coll=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!lone) {
    waking=1
    alarm[2]=60
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (carry) {owner.carry=0 owner.carryid=noone}

if (type="beetle") i=instance_create(x,y,beetle)
else if (type="red") i=instance_create(x,y,redkoopa)
else if (type="yel") i=instance_create(x,y,yelkoopa)
else if (type="blu") i=instance_create(x,y,blukoopa)
else if (type="spiny") i=instance_create(x,y,spiny)
else i=instance_create(x,y,koopa)

with (i) {biome=other.biome phase=other.owner powner=other.powner if (other.carry) {hitplayer=phase wakehit=2 paramode=1 xsc=esign(phase.x-x,-1)} else xsc=esign((instance_nearest(x,y,player)).x-x,-1) }
instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!carry) {
    if (trap) {
        x=(x*4+trap.x)/5
        y=(y*4+trap.y)/5
        speed=0
        stop=1
    } else {
        if (!lone && !sprenkick) {if (!inview()) instance_destroy()}
        calcmoving()
        time=max(0,time-1)
        if (vspeed<0) {
            vspeed+=0.15
            coll=collision(0,vspeed)
            if (coll) {
                sound("itemblockbump")
                if (object_is_ancestor(coll.object_index,hittable)) {
                    global.coll=owner
                    with (coll) {insted=1 go=-1 event_user(0) insted=0}
                }
                vspeed=1
            }
        }
        if (vspeed>=0) {

            if (collision(0,vspeed) && !grounded) {


            s=esign(vspeed,1)
            y+=vspeed
            while (collision(0,0)) {
                y-=s
            }
            if (vspeed!=0 && object_index=spiny && instance_exists(player))
                hspeed=0.5*esign(nearestplayer().x-x,-1)

            vspeed=0

            belt=collision(0,1)
            if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
                x=x+belt.beltspd;


                if (stop) {
                    vspeed=-abs(vspeed)*0.25
                    hspeed*=0.5
                }
                if (abs(vspeed)<0.5 || !stop) {
                    vspeed=0
                    if (stop) {
                        hspeed=0
                        kicked=0
                        stop=0
                    }
                }
            } else if !grounded {vspeed=min(4,vspeed+0.15)}
        }
        coll=collision(hspeed,-4)
        if (coll) {
            if goblu {
                i=instance_create(x,y,blukoopa)
                i.hspeed=sign(hspeed)*-1
                i.vspeed=-3
                i.walking=1
                sound("itemblockbump")
                if (object_is_ancestor(coll.object_index,hittable)) {
                    global.coll=owner
                    with (coll) {insted=1 go=-1 event_user(0) insted=0}
                }
                instance_destroy()
            }
            hspeed*=-1
            sound("itemblockbump")
            if (object_is_ancestor(coll.object_index,hittable)) {
                global.coll=owner
                with (coll) {insted=1 go=-1 event_user(0) insted=0}
            }
        }
        if (kicked) {alarm[1]=300 alarm[2]=-1 waking=0}
        else seqcount=3
    }
} else stop=0

sub="shell"
if (waking) sub="shellwake"
if (hspeed!=0 && !stop) sub="shellspin"
sprite=type+sub
if (intangible_timer) intangible_timer-=1
#define Collision_enemy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (carry || kicked) {
    seqcount+=1
    if (carry) seqcount=0
    with (other) {
        if (object_index=banzaibill) exit
        instance_create(mean(other.x,x),mean(other.y,y),kickpart)
        if ((object_index=shell && kicked) || other.carry) enemydie(other.id,other.seqcount)
        enemydie(id,other.seqcount)
    }
}
#define Collision_bowserboss
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.flash && !carry && kicked) {
    other.hp-=1
    other.owner=owner
    sound("enemybowserhurt")
    instance_create(mean(other.x,x),mean(other.y,y),kickpart)
    enemydie(id,0)
}
#define Collision_coin
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner) if (owner.object_index=player) {
    if (owner.name="kid") {
        with (owner) playsfx("kidglass")
        with (other) {instance_create(x,y,kickpart) instance_destroy()}
    } else {
        if (other.object_index=redcoin) with (other) {instance_create(x,y,glitter) gibcoinred(other.owner,1)}
        else if (other.object_index=coin) with (other) {instance_create(x,y,glitter) give_item(other.owner,"coin") instance_destroy()}
    }
}
#define Collision_token
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owner) if (owner.object_index=player) {
    if (owner.name="kid") {
        with (owner) playsfx("kidglass")
        with (other) {instance_create(x,y,kickpart) instance_destroy()}
    } else {
        with (other) {
            if (gibtoken(other.owner)) {
                spendblock()
                instance_destroy()
            }
        }
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (collision(0,0)) x=owner.x

carry=0
owner.carry=0
owner.carryid=noone
phase=owner

kicked=1

if (sign(owner.hsp)=owner.xsc) spd=max(3,abs(owner.hsp)+1)
else spd=3

vspeed=1

if (owner.up) {vspeed=-6 spd=abs(owner.hsp*0.75) hspeed=spd*esign(owner.hsp,owner.xsc) stop=1}
else if (owner.down) {stop=1 vspeed=owner.vsp x+=2*owner.xsc spd=abs(owner.hsp)+0.1 hspeed=spd*owner.xsc}
else hspeed=spd*owner.xsc
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=owner.carryoffx*owner.xsc
y+=owner.carryoffy
ssw_enemy()
x-=owner.carryoffx*owner.xsc
y-=owner.carryoffy
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lone=1
type=""
if (stype="1") type="red"
if (stype="2") type="beetle"
if (stype="3") type="spiny"
