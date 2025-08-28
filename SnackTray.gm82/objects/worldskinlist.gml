#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scrolls[0]=0
scrolls[1]=0
scrolls[2]=0
over1=0
over2=0
tab=0
alpha=0
anime=0
showhidden = (global.gamemode == "timeattack")

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
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///left click
if (other.x<x) {
    if (other.y=median(y+26,other.y,y+50)) {tab=0 sound("systemselect")}
    if (other.y=median(y+56,other.y,y+80)) {tab=1 sound("systemselect")}
    if (other.y=median(y+86,other.y,y+110)) {tab=2 sound("systemselect")}
} else {
    if (other.y<y+19) {scrolls[tab]=max(0,scrolls[tab]-1) sound("systemselect")}
    if (other.y>y+116) {
        if (tab=0) scrolls[0]=max(0,min(global.wskins[0,0]-2,scrolls[0]+1))
        if (tab=1) scrolls[1]=max(0,min(global.mskins[0,0]-2,scrolls[1]+1))
        if (tab=2) scrolls[2]=max(0,min(global.lskins[0,0]-2,scrolls[2]+1))
        sound("systemselect")
    }

    if (other.y>y+19 && other.y<y+116) {
        if (tab=0) {
            sel=scrolls[0]+(other.y>y+67)
            if (sel<global.wskins[0,0]) {
                if (global.worldskin2=global.worldskin) global.worldskin2=sel
                global.worldskin=sel
                sound("systemselect")
            }
        }
        if (tab=1) {
            sel=scrolls[1]+(other.y>y+67)
            if (sel<global.mskins[0,0]) {
                global.musicskin=sel
                global.worldskin2=global.worldskin
                sound("systemselect")
            }
        }
        if (tab=2) {
            sel=scrolls[2]+(other.y>y+67)
            if (sel<global.lskins[0,0]) {
                global.levelskin=sel
                sound("systemselect")
                applylevelpack(global.lskins[1+global.levelskin,0],showhidden)
            }
        }
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///right click
if (other.x>=x && other.y>y+19 && other.y<y+116 && tab=0) {
    sel=scrolls[0]+(other.y>y+67)
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

if (tab=0) scrolls[0]=median(0,scrolls[0]+other.wdown-other.wup,max(0,global.wskins[0,0]-2))
if (tab=1) scrolls[1]=median(0,scrolls[1]+other.wdown-other.wup,max(0,global.mskins[0,0]-2))
if (tab=2) scrolls[2]=median(0,scrolls[2]+other.wdown-other.wup,max(0,global.lskins[0,0]-2))
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///auto focus scrolling
scrolls[0]=max(0,global.worldskin-1)
scrolls[1]=max(0,global.musicskin-1)
scrolls[2]=max(0,global.levelskin-1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,tab,x,y)
if (over1) draw_sprite(sprite_index,3,x,y)
if (over2) draw_sprite(sprite_index,4,x,y)

if (tab=0) {
    for (i=0;i<2;i+=1) {
        k=i+scrolls[0]
        if (k<global.wskins[0,0]) {
            xx=x+1
            yy=y+20+i*48
            spr=global.wskins[k+1,1]
            if (spr=-1) {
                rect(xx,yy,96,48,0,1)
                global.halign=1
                global.valign=1
                draw_systext(xx+48,yy+24,wordwrap(string_replace(string_replace(global.wskins[k+1,0],"world\",""),"\",""),11))
                global.halign=0
                global.valign=0
            } else draw_sprite_stretched(spr,0,xx,yy,96,48)
            if (k=global.worldskin) draw_sprite_ext(sprite_index,5,xx,yy,1,1,0,$ffffff,alpha)
            if (k=global.worldskin2 && global.worldskin2!=global.worldskin) draw_sprite_ext(sprite_index,8,xx,yy,1,1,0,$ffffff,1-alpha)
        }
    }
}
if (tab=1) {
    for (i=0;i<2;i+=1) {
        k=i+scrolls[1]
        if (k<global.mskins[0,0]) {
            xx=x+1
            yy=y+20+i*48
            spr=global.mskins[k+1,1]
            if (k=0) {
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
                draw_systext(xx+48,yy+24,wordwrap(string_replace(string_replace(global.mskins[k+1,0],"music\",""),"\",""),11))
                global.halign=0
                global.valign=0
            } else draw_sprite_stretched(spr,0,xx,yy,96,48)
            if (k=global.musicskin) draw_sprite_ext(sprite_index,6,xx,yy,1,1,0,$ffffff,alpha)
        }
    }
}
if (tab=2) {
    for (i=0;i<2;i+=1) {
        k=i+scrolls[2]
        if (k<global.lskins[0,0]) {
            xx=x+1
            yy=y+20+i*48
            spr=global.lskins[k+1,1]
            if (spr=-1) {
                rect(xx,yy,96,48,0,1)
                global.halign=1
                global.valign=1
                draw_systext(xx+48,yy+24,wordwrap(string_replace(string_replace(global.lskins[k+1,0],"level\",""),"\",""),11))
                global.halign=0
                global.valign=0
            } else draw_sprite_stretched(spr,0,xx,yy,96,48)
            if (k=global.levelskin) draw_sprite_ext(sprite_index,6,xx,yy,1,1,0,$ffffff,alpha)
        }
    }
}
draw_sprite(sprite_index,7,x,y)
