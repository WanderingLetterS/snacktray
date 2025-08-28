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
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_exists(player) {
    alarm[1]=2
    exit
}

if (string_count(global.leveldesc,"$finale") && region.type == "Castle") {
   sheet=global.bowsersheet[biome]
   btype=1
   with (player) {
      if (name="bowser") {
         other.dowser=1
         other.sheet=global.dowsersheet[biome]
         other.btype=2
      }
   }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vx=0 for (i=0;i<global.mplay;i+=1) vx=max(view_xview[i],vx)
if (canfire && x>vx+464 && x<vx+1000) {count+=1 if (count>180) {count=0
    with (instance_create(vx+448,round(ystart-8),firemissile)) {dowser=other.dowser ygo=round(rchoose(other.ystart,other.ystart-16,other.ystart-32)/16)*16+8}
    sound("enemycastlefire")
}}

if (!inview() && !startinview() && !panic) {y=ystart x=xstart jump=0 dir=0 cjump=60 step=3 alarm[0]=60 speed=0 exit}

if (music && !musiclock) {
    if (skindat("bossmusic")) {
        switch btype {
            case 2:
                if global.founddowsermusic {
                    mus_play("finaldoss",1)
                    global.music="finaldoss"
                    break
                }
            case 1:
                mus_play("finalboss",1)
                global.music="finalboss"
                break
            default:
                mus_play("boss",1)
                global.music="boss"
                break
        }
        musiclock=1
    }
}

flash=max(0,flash-1)
if (hp<=0 && !dead) {
    dead=1
    with (instance_create(x,y,deadfakebowser)) {xsc=other.xsc kil=1 sheet=other.sheet}
    if (!btype) sound("enemybowserdown") else {sound("finalbowserfall") sound("finalbowserdie", 0, 1 - (dowser * 0.165))}
    if (owner) {global.scor[owner.p2]+=5000 owner.enemyc+=10 if (musiclock&&!global.finishmusic) {if !btype stagemusic(owner) else mus_stop()}}
    instance_destroy()
}
owner=0

o=instance_nearest(x,y,player)
if (o) xsc=esign(x-o.x,xsc)

if (panic) {
    hspeed=0
    gonnathrow=0
    step=(step+0.125) mod 2
    if (!dead) panicc+=1
    if (panicc>128 && !jump) {panic=0 dir=0 fire=0 fcount=0 step=5 vspeed=-1 jump=1 alarm[0]=60}
} else {
    hspeed=dir*0.25
    if (fbb<16 && !jump) step=modulo(step+xsc*hspeed/4,2,6)
    if (x>xstart+56) dir=-1
    if (x<xstart-56) dir=1

    if (canfire) {
        if (fire) {
            fbb+=1
            if (fbb>16) {hspeed=0 step=max(0,floor((step-3)/2))*2+3}
            if (fbb>32) {
                fire-=1
                if (fire=0) fbb=0 else fbb=-64;
                i=instance_create(x-16*xsc,round(y-8),firemissile)
                i.ygo=round(rchoose(y,y-16,y-32)/16)*16+8
                i.hspeed=-xsc*1.25
                i.xsc=xsc
                i.owner=id
                i.dowser=dowser
                sound("enemycastlefire")
            }
        } else {
            fcount+=1
            if (fcount>180) {
                fire=1+round(myrand(2))
                fcount=0
            }
        }
    }

    if (hammers) {
        hc+=1 if (hc=4) {
            hc=0
            if (gonnathrow) with (instance_create(x,y-8,hammer)) {dowser=other.dowser xsc=other.xsc hspeed=-xsc type=1 owner=other.id}
            gonnathrow=!round(myrand(4))
        }
    }
}

if (collision(sign(hspeed),0)) {dir*=-1 hspeed*=-1}
if (place_meeting(x,y,axe)) dir=sign(xstart-x)

if (vspeed<0) if (collision(0,vspeed)) vspeed=0

player_nslopforce()
if (coll && vspeed>=0 && !dead) {
    if (coll.object_index == lavablock) {
        dead=1
        depth=1000004
        hsp=0
        panic=1
        if (!btype) sound("enemybowserdown") else {sound("finalbowserfall") sound("finalbowserdie", 0, 1 - (dowser * 0.165))}
        global.scor[o.p2]+=5000
        o.enemyc+=10
    } else {
        vspeed=0
        jump=0
    }
} else {vspeed=min(4-3.5*dead,vspeed+0.1) jump=1}

if (!dead && pitdeath()) {
    dead=1
    depth=1000004
    panic=1
    if (!btype) sound("enemybowserdown") else {sound("finalbowserfall") sound("finalbowserdie", 0, 1 - (dowser * 0.165))}
    global.scor[o.p2]+=5000
    o.enemyc+=10
}

if (dead && !stopmus && btype) {mus_stop() stopmus=1}

if (dead) {bbb+=1 if (bbb=32) flash=32 if (bbb=64) {
    with (firemissile) if (owner=other.id) instance_destroy()
    with (hammer) if (owner=other.id) instance_destroy()
    if (musiclock&&!global.finishmusic && !btype) stagemusic(o)
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
        if (power_lv>2 || glide || insta || slide || super || spin || (spinjump && vsp>0)) {
            other.hp-=1
            other.owner=id
            other.flash=64
            sound("enemybowserhurt")
            glide=0
        } else if teleport<9 && teleport>0 && name="ashura" {
            other.hp=0
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
btype=0

alarm[1]=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flash mod 5<3) ssw_boss()
