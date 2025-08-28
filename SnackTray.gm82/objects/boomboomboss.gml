#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=1
count=179
owner=0
musiclock=0
dir=-1
step=0

hp=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=-xsc
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vx=0 for (i=0;i<global.mplay;i+=1) vx=max(view_xview[i],vx)

if (!inview() && !startinview() && !panic) {y=ystart x=xstart jump=0 dir=0 cjump=60 step=3 alarm[0]=60 speed=0 exit}

if (music && !musiclock) {if (skindat("bossmusic")) mus_play("boss",1) global.music="boss" musiclock=1}

flash=max(0,flash-1)
if (hp<=0 && !stompytimer) {
    hp=10
    stompytimer=60
    hurt=1
}
owner=0

o=instance_nearest(x,y,player)
if (o) xsc=esign(hspeed,xsc)

if (hurt) {
    hspeed=0
    stomped_count+=1
    gonnathrow=0
    step=(step+0.125) mod 2
    if (!dead) panicc+=1
    if (stomped_count>2) {vspeed=1 alarm[0]=60}
} else {
    hspeed=dir*2
    if (fbb<16 && !jump) step=modulo(step+xsc*hspeed/4,2,6)
    if (x>xstart+56) dir=-1
    if (x<xstart-56) dir=1
}

if (collision(sign(hspeed),0)) {dir*=-1 hspeed*=-1}
if (place_meeting(x,y,axe)) dir=sign(xstart-x)

if (vspeed<0) if (collision(0,vspeed)) vspeed=0

yground=easyground()
if (bbox_bottom>=yground-1-4*(vspeed=0) && yground!=verybignumber && vspeed>=0 && !dead) {
    if (place_meeting(x,y+8,lavablock)) {
        dead=1
        depth=1000004
        hsp=0
        panic=1
        sound("enemybowserdown")
        global.scor[o.p2]+=5000
        o.enemyc+=10
    } else {
        vspeed=0
        jump=0
        y=yground-(bbox_bottom-y)-1
    }
} else {vspeed=min(4-3.5*dead,vspeed+0.1) jump=1}

if (!dead && pitdeath()) {
    dead=1
    depth=1000004
    panic=1
    sound("enemybowserdown")
    global.scor[o.p2]+=5000
    o.enemyc+=10
}

if (dead) {bbb+=1 if (bbb=32) flash=32 if (bbb=64) {
    with (firemissile) if (owner=other.id) instance_destroy()
    with (hammer) if (owner=other.id) instance_destroy()
    if (musiclock&&!global.finishmusic) stagemusic(o)
    instance_destroy()
}}

if (!jump && !panic && dir!=0) {
    if (o.y<y-32) cjump-=1
    cjump-=1 if (cjump<0) {
        jump=1
        cjump=30+round(myrand(30))
        vspeed=-2.75
    }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!panic) with (other) {
    if (!super) {eject() if (x<other.x) hsp=min(-1,hsp) else hsp=max(1,hsp)}
    if (!other.flash && !intangible()) {
        if (power_lv>2 || glide || insta || slide || super || spin || (jump && vsp>0))&&!other.spikedmoment {
            other.hurt=1
            other.owner=id
            other.flash=64
            sound("enemybowserhurt")
            glide=0
        } else if teleport<9 && teleport>0 {
            other.hurt=1
            sound("enemybowserhurt")
        } else hurtplayer("enemy")
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hammers=funnytruefalse(hammers)
canfire=funnytruefalse(canfire)
music=funnytruefalse(music)

getregion(x)
sheet=global.bosssheet[biome]
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flash mod 5<3) ssw_boss()
