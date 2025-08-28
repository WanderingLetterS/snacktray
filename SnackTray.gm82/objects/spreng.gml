#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
frame=0

c=1
target=0

velocity=-7
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var s;
if (c) if (inview()) {
    yground=easyground()
    if (y>=yground-16-4*(vspeed=0)) {
    vspeed=0
    y=yground-16
    belt=collision(0,1)
        if belt.object_index=conveyorbelt && !collision(belt.beltspd,0) && !collision(-belt.beltspd,0)
        x=x+belt.beltspd;
    }
    else vspeed=min(3,vspeed+0.25)

    global.coll=owner
} else y-=vspeed

shot=max(0,shot-1)
if (shot) frame=4-ceil(shot/4)
else {
    frame=0

    with (player) if (!intangible()) if (place_meeting(x+4,y+4*!!coyote,other.id) || place_meeting(x-4,y+4*!!coyote,other.id)) {
        s=esign(x-(other.x+8),1)
        hsp=4*s
        hyperspeed=2*s
        if (name!="robo") xsc=s
        if(name="kid") hyperspeed=5*s
        spronge=other.id
        sound("itemspring")
        spindash=0
        pound=0
        if(climb || glide) {
            climb=0
            glide=0
            fall=4
        }

        other.shot=12 other.dir=sign(x-other.x)
    }
    with (item) if (c && object_index!=starshard && object_index!=redcoin && object_index!=token) if (place_meeting(x-4,y,other.id) || place_meeting(x+4,y,other.id)) {
        s=esign(x-(other.x+8),esign(-hspeed,1))
        hspeed=abs(hspeed)*s
        hsp=3*s
        vspeed=-2
            if (object_index=coin) {
                with (instance_create(x,y,itemdrop)) {
                    type="coinup"
                    hspeed=other.hspeed
                    vspeed=-2
                }
                instance_destroy()
            }
        sound("itemspring") other.shot=12 other.dir=sign(x-other.x)
    }
    with (itemdrop) if (place_meeting(x-4,y,other.id) || place_meeting(x+4,y,other.id)) {
        hspeed=2*esign(x-(other.x+8),esign(-hspeed,1))
        vspeed=-2
        sound("itemspring") other.shot=12 other.dir=sign(x-other.x)
    }
    with (enemy) if (object_index!=bulletbill && object_index!=bullseyebill && object_index!=banzaibill && object_index!=lakitu && object_index!=blooper && object_index!=cheepred && object_index!=cheepwhite && object_index!=cheepfly && object_index!=orbinautgreen && object_index!=orbinautblue && object_index!=orbinautred && object_index!=orbinautbumper && !(object_index=piranha && !loose) && !carry) {
        if (place_meeting(x-4,y,other.id) || place_meeting(x+4,y,other.id)) {
            s=esign(x-(other.x+8),esign(-hspeed,1))
            hspeed=abs(hspeed)*s
            hsp=3*s
            vspeed=-1

            if (object_index=shell) {
                hspeed=4*s
                hsp=0
                if(!kicked) {
                    kicked=1
                    kickup=0
                    owner=nearestplayer()
                }
            }
            if (object_index=koopa || object_index=hopkoopa) {
                with (instance_create(x,y,shell)) {
                    sprenkick=1
                    vspeed=-1
                    hspeed=4*s
                    kicked=1
                    owner=nearestplayer()
                }
                instance_destroy()
            }
            if (object_index=redkoopa || object_index=redhover) {
                with (instance_create(x,y,shell)) {
                    sprenkick=1
                    vspeed=-1
                    hspeed=4*s
                    kicked=1
                    owner=nearestplayer()
                    type="red"
                }
                instance_destroy()
            }
            if (object_index=beetle) {
                with (instance_create(x,y,shell)) {
                    sprenkick=1
                    vspeed=-1
                    hspeed=4*s
                    kicked=1
                    owner=nearestplayer()
                    type="beetle"
                }
                instance_destroy()
            }
            sound("itemspring") {other.shot=12 other.dir=sign(x-other.x)}
        }
    }

    if (shot=12) {springsmokeside(x+8,y+8,dir) dir=0}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("spreng")
