#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame=0
animframe=0
pl=skindat("prin")

hit=0
done=0
wait=0

sheet=skindat("tex_retainer")
nextlevel=""

o=0
super_duper_lame_cheater=0
ackbar=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(0,0,timecounter)) {
    myretainer=other.id
    sound("systemtimecount",1)
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.animatePrincess>0 && animframe<1) {animframe+=1 alarm[1]=15}
#define Alarm_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.nextlevel=nextlevel
if (mode && global.gamemode!="timeattack") segafadeto(titlescreen)
else game_stageend()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var frameprev;
frameprev=floor(frame);

if (o=0) {
    if (!princess) {frame=modulo(frame+0.0625,0,4) animframe=0} else {global.animatePrincess=1 if (animframe<1) {alarm[1]=15}}
} else {
    if (hide=128) {if (advance()) gamemanager.alarm[1]=1}
    if (princess) {

        if (!instance_exists(timecounter)) hide=min(512,hide+1) frame=(hide>64)+(hide>128)
        if (hide=96) {done=1 alarm[0]=2 alarm[1]=30}
        if (global.emeralds == 7) {unlockchar("super")}

    } else {

        hide=min(128+(32*yare)+(62*mylains)+(128*(fatloser + obama)),hide+1)
        frame=min(frame+0.25,7)
        wait=max(0,wait-1)
        if (frame>4 && !done && !wait) {
            if (yare || mylains) {done=1 alarm[0]=30}
            else {
                k=min(5,count)
                for (i=0;i<k;i+=1) {
                    j=instance_create(x,y+8,retainee)
                    j.direction=90-45*((i+0.5)/k-0.5)
                    j.speed=2+sqrt(bbb)/2
                    j.mode=mode
                    if (mode && global.gamemode!="timeattack") {
                        unlockchar("ashura")
                        j.vspeed=-3
                    }
                }
                count-=k
                if (count=0) {done=1 alarm[0]=30} else wait=max(1,10-sqrt(bbb))
                sound("itemretainer")
                bbb+=1

            }
        }
    }
    if (hide=512) if (advance()) {done=1 if (global.gamemode="classic") inputclassic() if global.gamemode!="timeattack" segafadeto(credroll) else game_stageend()}
}
if (floor(frame) != frameprev) {alarm[1]=15 animframe=0}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!hit) {
    hit=1
    if (princess) {
        stats("princesses rescued",stats("princesses rescued")+1)
        //savemovie()
        mus_fade()
    } else {
        mus_play("finishworld",0) global.finishmusic=1
    }
    o=other.id
    o.finish=1
    o.timeend=o.time
    o.ending="retainer"
    o.myretainer=id
    gamemanager.timedead=1
    frame=0
    animframe=0
    global.overridelight = approach_val(global.overridelight, 0, 1)
    with (player) if (id!=other.o) {piped=1 flash=1}
    if super_duper_lame_cheater {
        if global.gamemode=="timeattack" global.cheater=1
        ackbar=1
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (nextlevel="ashuraissecretlyinsonicbollwowhowincredibletheychangedthepasswordtoowow") {
    mode=1
    count=1
    princess=0
    yare=0
    obama=0
    mylains=0
} else {
    if (string_copy(nextlevel,1,40)="XXXXXFATLOSER22020EPICGAMINGMONTAGEXXXXX") {
        yare=0
        obama=0
        mylains=0
        fatloser=1
        nextlevel=string_delete(nextlevel,1,41)
    }

    princess=(nextlevel="") && !global.quickplaying
    if (!princess && !fatloser) {
        count=unreal(hostages,1)
        yare=egg()
        if (!yare) obama=egg()
        if (!obama) fatloser=egg()
        if (!fatloser) mylains=egg()
        if (fatloser) count=0
        if (mylains) {
            if !throweeobj {
                throweeobj=object_add()
                object_event_add(throweeobj,ev_create,0,"alpha=1 visible=1 name=owner.o.name p2=owner.o.p2 size=owner.o.size orig=owner.o is_spriteswitcher=1 charm_init() sheet=owner.o.sheets[owner.o.size] gravity=0 frame=0 frspd=0 xsc=1 ysc=1")
                object_event_add(throweeobj,ev_step,ev_step_end,"spriteswitch(1)")
                object_event_add(throweeobj,ev_draw,0,"spriteswitch(0)")
                object_set_persistent(throweeobj,1)
            }
        }
    } else depth=-1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (o) p2=o.p2
else p2=0

ss=string(p2)

if (mylains) {
    draw_sprite(spr_lainthrow,floor(img),x+16,y)
    if (hide=128) {
        o.visible=0
        o.alpha=0
        o.piped=1

        throwee=instance_create(x+60,y-70,throweeobj)
        throwee.depth=depth-1
        throwee.throwspd=0.0125
        throwee.size=o.size
        throwee.thrown=0
    }
    if (hide>128) {
        img=min(36,img+0.2)
    }
    if (img>22 && img<24) {
        throwee.x+=1
    }
    if (img>24 && !throwee.thrown) {
        throwee.thrown=1
    }
    if (throwee.thrown) {
        if !throwee.depth=-verybignumber throwee.depth=-verybignumber
        throwee.sprite_angle+=-1
        throwee.xsc+=throwee.throwspd/4
        throwee.ysc+=throwee.throwspd/4
        throwee.x-=5*(throwee.throwspd)
        throwee.y+=2*(throwee.throwspd)
        throwee.throwspd*=1.15
        with (throwee) {if (xsc>=10 || ysc>=10) instance_destroy()}
    }
} else if (yare) {
    draw_sprite(spr_yare,floor(img),floor(x),floor(y))
    if (hide>64) {
        if (hide=160) img=min(10,img+0.1)
        else img=min(8,img+0.1)
        if (img>=8) {
            global.halign=1
            draw_skintext(x-8,80,"YARE YARE DAZE.")
            global.halign=0
        }
    } else img=(img+0.05) mod 6
} else {
    str=""
    if (fatloser) {
        if (hide) img+=1
        draw_sprite_ext(spr_fatswagger,0,x,y,-1+2*((img mod 7)<4),1,0,$ffffff,1)
        if (hide>=128) str+="hey dudez"
        if (hide>=192) str+="##360 noscope B)"
        if (hide>=256) str+="##sub to fatloser2 today"
    }
    else if (princess) {
        if (hide>=128) str+=playerskinstr(p2,"savetext1"+ss)
        if (hide>=192) str+="##"+playerskinstr(p2,"savetext2"+ss)
        if (hide>=256) str+="##"+playerskinstr(p2,"savetext3"+ss)
        if (hide>=320) str+="##"+playerskinstr(p2,"savetext4"+ss)
        if (hide>=384) str+="##"+playerskinstr(p2,"savetext5"+ss)
        if (hide>=448) str+="##"+playerskinstr(p2,"savetext6"+ss)
        str=replacekeyword(str,"player",playerskinstr(p2,"name"+string(p2)))
        draw_sprite_part(skindat("tex_princess"+ss),0,8+113*animframe,8+113*frame,112,112,x-32,y-88+pl)
    } else {
        ssw_effects("retainer")

        if (mode || hide<=0) exit

        str="#"+replacekeyword(skinstr("langthanks"),"player",playerskinstr(p2,"name"+string(p2)),"princess",playerskinstr(p2,"princess"+ss))
        if (hide>=128) str+="###"+replacekeyword(skinstr("langbut"),"player",playerskinstr(p2,"name"+string(p2)),"princess",playerskinstr(p2,"princess"+ss))

        if (obama) {
            str="Ha ha ha..."
            if (hide>=128)      str+="##You mean the"
            if (hide>=152 && hide<168)      str+="##Chaos          "
            else if (hide>=168) str+="##Chaos Emeralds?"
        }
    }

    global.halign=1
    draw_skintext(x,y-104-(16*princess),wordwrap(skin_upper(str),26))
    global.halign=0
}
