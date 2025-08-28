#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=0

go=0
option=0
get=-1

abut=0 h=0 v=0

str=""

setkey=-1
mode="key"

joynum=0
joy=0

keyb=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var h,v,WHAT__HELP_ME;

if (go) {
    f=max(0,f-0.05)
    if (f=0) instance_destroy()
    exit
}
f=min(1,f+0.05)

if (wait) wait-=1

if (!wait) {
    if (setkeys) {
        if (input_esc()) {
            setkeys=0
            setkey=-1
            if (resetbinds) settings_resetbinds(1)
            else if (mode="key") unpackkeyboard()
            sound("systemreturn")
            str=""
            wait=1
        } else {
            if (mode="key") valid=keyvalid(keyboard_key)
            else {key=joycompare() valid=(key!="")}
            if (valid) {
                wait=20
                if (mode="key") global.key[setkey,keyb]=keyboard_key
                else joymap[setkey]=key
                setkey+=1 if (setkey=12) {setkey=-1 setkeys=0 resetbinds=0}
                str=""
                io_clear()
                sound("systemselect")
            }
        }
    } else {
        input_get(0)
        input_keystates()
        WHAT__HELP_ME=keyboard_check(vk_f6)

        h=right-left
        v=down-up

        abut = (abut || sbut) - WHAT__HELP_ME

        if (cbut || keyboard_check_pressed(vk_escape)) {
            go=1
            if (mode="key") unpackkeyboard()
            sound("systemreturn")
        }

        if (h!=0 || v!=0 || abut!=0) {//prevent repeating input
            if (lock) {h=0 v=0 abut=0}
            lock=1
        } else lock=0
    }
}

if (h!=0 || v!=0 || abut || str="" || WHAT__HELP_ME) {
    if (!setkeys && !wait) {
        if (v!=0) {
            option=median(0,option+v,4)
            sound("systemselect")
        }
        if (WHAT__HELP_ME) {
            settings_resetbinds()
            WHAT__HELP_ME=0
            abut=0
            h=0
        }
        if (abut || h!=0) {
            if (option=0) {
                sound("systemselect")
                if (mode="key") keyb=!keyb
                else {joy=modulo(joy+h,0,global.joynum) event_user(0)}
                str=""
            }
            if (option=1 && abut) {
                sound("systemselect")
                setkey=0
                setkeys=1
                str=""
                io_clear()
                if (mode!="key") joysnap()
                wait=20
            }
            if (option=2 && abut) {
                go=1

                if (mode="key") {
                    a="" for (i=0;i<12;i+=1) a+=string(global.key[i,0])+"|"
                    settings("keyboard1",a)
                    a="" for (i=0;i<12;i+=1) a+=string(global.key[i,1])+"|"
                    settings("keyboard2",a)
                } else {
                    a="" for (i=0;i<12;i+=1) a+=string(joymap[i])+"|"
                    settings("joymaps "+joyname,a)
                }
                sound("systemstart")
                global.settingschanged=1
                saveopt()
            }
            if ((option=3 && abut)) {
                settings_resetbinds()
            }
            if (option=4 && abut) {
                go=1
                applysettings()
                sound("systemreturn")
            }
        }
    }

    if (mode="key") {
        str=lang("opts key")+"##"+
        "${l=6}"+
        "  "+arrow(option=0)+lang("key name")+string(1+keyb)+"##"+
        "  "+arrow(option=1 && !setkeys)+lang("key set")+"##"+
        "  "+arrow(option=2)+lang("key end")+"##"+
        "  "+arrow(option=3)+lang("key reset")+"##"+
        "  "+arrow(option=4)+lang("key cancel")+"##"+
        "${l=9}"
        for (i=0;i<12;i+=1) str+=" "+arrow(setkey=i)+paddington(lang(inputype(i))+": ",10)+keyname(global.key[i,keyb])+"#"
    } else {
        str=lang("opts joy")+"####"+
        "${l=6}"+
        "  "+arrow(option=1 && !setkeys)+lang("joy set")+"##"+
        "  "+arrow(option=2)+lang("key end")+"##"+
        "  "+arrow(option=3)+lang("key reset")+"##"+
        "  "+arrow(option=4)+lang("key cancel")+"##"+
        "${l=9}"
        for (i=0;i<12;i+=1) str+=arrow(setkey=i)+paddington(lang(inputype(i))+": ",10)+joymap[i]+"#"
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
unpackjoyconfig(joy)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rect(0,0,401,225,0,f*0.5)
draw_sprite_ext(spr_configbox,0,87,22,1,1,0,$ffffff,f)
draw_systext(200-88,30,str,$ffffff,f)
if (mode!="key" && str!="") {
    global.halign=1
    draw_systext(200,56,arrow(option=0)+"["+wordwrap(joyname,32)+"]",playercol(JOY+joy),f)
    global.halign=0
}
