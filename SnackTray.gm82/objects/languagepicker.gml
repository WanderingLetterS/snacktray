#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0
alpha=0

if (settings("languagepick")) event_user(1)
else {
    langs[0]=1
    langs[1,0]=""
    langs[1,1]="English"
    fn=file_find_first("mods\language\*.txt",0)
    while (fn!="") {
        if (fn!="example.txt") {
            langs[0]+=1
            langs[langs[0],0]=fn
            f=file_text_open_read("mods\language\"+fn)
            do {
                str=file_text_read_string(f)
                file_text_readln(f)
                p=string_pos("name=",str)
            } until (file_text_eof(f) || p)
            if (file_text_eof(f)) langs[0]-=1
            else langs[langs[0],1]=string_delete(str,p,5)
            file_text_close(f)
        }
        fn=file_find_next()
    }
    file_find_close()

    h=langs[0]*8

    y-=h

    if (langs[0,0]=1) {
        settings("languagepick",1)
        event_user(1)
    } else {
        with (instance_create(global.screenwidth/2,y+8,genericcursor)) {
            image_blend=playercol(0,0)
            special=1
        }

        visible=1
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fade) {
    alpha=max(0,alpha-0.02)
    if (alpha=0) event_user(1)
} else alpha=min(1,alpha+0.02)

if (visible && alpha=1) {
    sel=median(0,floor((genericcursor.y-y+4)/16),langs[0]-1)
    if (advance()) event_user(0)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!fade) {
    if (sel) {
        settings("language",langs[sel+1,0])
        setlang()
    }
    settings("languagepick",1)
    sound("systemselect")
    fade=1
    with (genericcursor) instance_destroy()
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
visible=0
instance_create(0,0,introctrl)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
str=""
for (i=0;i<langs[0];i+=1) {
    if (sel=i && alpha=1) str+="["+langs[i+1,1]+"]##"
    else str+=langs[i+1,1]+"##"
}

global.halign=1
draw_systext(x,y,str,$ffffff,alpha)
global.halign=0
