#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scrolls[0]=0
scrolls[1]=0
scrolls[2]=0
tab=2
over1=0
over2=0
alpha=0
anime=0
showhidden = 1


pin=settings("wskinpin")
if (pin!="") {
    for (i=1;i<global.wskins[0,0];i+=1) { //this specific skin type is counted different from the other two Never Change Old Engine
        if (global.wskins[i+1,0]=pin) {
            global.worldskin=i pin="done"
            break
        }
    }
    if (pin!="done") {global.worldskin=0 settings("wskinpin","")}
} else global.worldskin=0
global.worldskin2=global.worldskin

pin=settings("mskinpin")
if (pin!="") {
    for (i=1;i<global.mskins[0,0];i+=1) {
        if (global.mskins[i,0]=pin) {
            global.musicskin=i-1 pin="done"
            break
        }
    }
    if (pin!="done") {global.musicskin=0 settings("mskinpin","")}
} else global.musicskin=0
pin=settings("lskinpin")
if (pin!="") {
    for (i=1;i<global.lskins[0,0];i+=1) {
        if (global.lskins[i,0]=pin) {
            global.levelskin=i-1 pin="done"
            applylevelpack(global.lskins[1+global.levelskin,0],showhidden)
            break
        }
    }
    if (pin!="done") {settings("lskinpin","") global.levelskin=0 applylevelpack(global.lskins[1,0],showhidden)}
} else {global.levelskin=0 applylevelpack(global.lskins[1,0],showhidden)}

event_user(3)
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over1=0
over2=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
anime=(anime+1) mod 32
alpha=0.5+0.5*sin(pi*(anime/16))

if (genericcursor.ybut) {sound("systemselect") tab = wrap_val(tab+1, 0, 2)}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///left click
    if (other.x<x+20) {
        scrolls[tab]=max(0,scrolls[tab]-1)
        sound("systemselect")
    }
    else if (other.x>bbox_right-20) {
        var type;
        if tab=0 type=global.wskins[0,0]
        else if tab=1 type=global.mskins[0,0]
        else if tab=2 type=global.lskins[0,0]

        scrolls[tab]=max(0,min(type-1,scrolls[tab]+1))
        sound("systemselect")
    }

    sel=scrolls[tab]
    if (sel<global.wskins[0,0] && tab=0) {
        if (global.worldskin2 = global.worldskin) global.worldskin2=sel
        global.worldskin=sel
        sound("systemselect")
    } else if (sel<global.mskins[0,0] && tab=1) {
        global.musicskin=sel
        global.worldskin2=global.worldskin
        sound("systemselect")
    } else if (sel<global.lskins[0,0] && tab=2) {
        global.levelskin=sel
        sound("systemselect")
        applylevelpack(global.lskins[1+global.levelskin,0],showhidden)
    }
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///right click
if (other.x>=x && other.y>y+19 && other.y<y+116 && tab=0) {
    sel=scrolls[0]
    if (sel<global.wskins[0,0]) {
        global.worldskin2=sel
        if (global.worldskin2!=global.worldskin) global.musicskin=0
        sound("systemselect")
    }
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///scroll wheel
if (other.wdown || other.wup) sound("systemselect")

if (tab=0) scrolls[0]=median(0,scrolls[0]+other.wdown-other.wup,max(0,global.wskins[0,0]-1))
if (tab=1) scrolls[1]=median(0,scrolls[1]+other.wdown-other.wup,max(0,global.mskins[0,0]-1))
if (tab=2) scrolls[2]=median(0,scrolls[2]+other.wdown-other.wup,max(0,global.lskins[0,0]-1))
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///auto focus scrolling
scrolls[0]=max(0,global.worldskin)
scrolls[1]=max(0,global.musicskin)
scrolls[2]=max(0,global.levelskin)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
draw_self()
if (over1) draw_sprite(sprite_index,1,x,y)
if (over2) draw_sprite(sprite_index,2,x,y)

if (scrolls[0]<global.wskins[0,0] && tab=0) {
    xx=x+20
    yy=y+1
    spr=global.wskins[scrolls[0]+1,1]
    if (spr=-1) {
        rect(xx,yy,96,48,0,1)
        global.halign=1
        global.valign=1
        draw_systext(xx+48,yy+24,wordwrap(string_replace(string_replace(global.wskins[scrolls[0]+1,0],"world\",""),"\",""),11))
        global.halign=0
        global.valign=0
    } else draw_sprite_stretched(spr,0,xx,yy,96,48)
    if (scrolls[0]=global.worldskin) draw_sprite_ext(sprite_index,4,x,y,1,1,0,$ffffff,alpha)
    if (scrolls[0]=global.worldskin2 && global.worldskin2!=global.worldskin) draw_sprite_ext(sprite_index,5,x,y,1,1,0,$ffffff,1-alpha)
}

if (scrolls[1]<global.mskins[0,0] && tab=1) {
    xx=x+20
    yy=y+1
    spr=global.mskins[scrolls[1]+1,1]
    if !scrolls[1] {
        spr=global.wskins[global.worldskin2+1,1]
        if (spr=-1) {
            rect(xx,yy,96,48,0,1)
            global.halign=1
            global.valign=1
            draw_systext(xx+48,yy+24,wordwrap(string_replace(string_replace(global.wskins[k+1,0],"world\",""),"\",""),11))
            global.halign=0
            global.valign=0
        } else draw_sprite_stretched(spr,0,xx,yy,96,48)
    } else if (spr=-1) {
        rect(xx,yy,96,48,0,1)
        global.halign=1
        global.valign=1
        draw_systext(xx+48,yy+24,wordwrap(string_replace(string_replace(global.mskins[scrolls[1]+1,0],"music\",""),"\",""),11))
        global.halign=0
        global.valign=0
    } else draw_sprite_stretched(spr,0,xx,yy,96,48)
    if (scrolls[1]=global.musicskin) draw_sprite_ext(sprite_index,3,x,y,1,1,0,$ffffff,alpha)
}

if (scrolls[2]<global.lskins[0,0] && tab=2) {
    xx=x+20
    yy=y+1
    spr=global.lskins[scrolls[2]+1,1]
    if (spr=-1) {
        rect(xx,yy,96,48,0,1)
        global.halign=1
        global.valign=1
        draw_systext(xx+48,yy+24,wordwrap(string_replace(string_replace(global.lskins[scrolls[2]+1,0],"level\",""),"\",""),11))
        global.halign=0
        global.valign=0
    } else draw_sprite_stretched(spr,0,xx,yy,96,48)
    if (scrolls[2]=global.levelskin) draw_sprite_ext(sprite_index,3,x,y,1,1,0,$ffffff,alpha)
}
