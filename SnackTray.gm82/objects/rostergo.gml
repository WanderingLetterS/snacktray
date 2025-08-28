#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if room==ta_roster mask_index=spr_optbox else image_xscale=200

go=0 f=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=0
if (room != ta_menu) {
    with (rosterbox) if (ready) other.go=1
} else go=1

f=inch(f,go*(5+((room==ta_roster)*3)),1+(room==ta_roster))
if room==ta_roster image_yscale=f/8 else image_yscale=f+1

if (room=ta_menu && genericcursor.xbut) {sound("systemselect") global.tasing=!global.tasing}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    if (room == ta_menu) {
        with (tactrl) event_user(0)
    } else {
        with (rosterctrl) event_user(0)
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (f>0) {
    if room!=ta_roster rect(0,y-f-1,500,f*2+2,$ffffff,1)
    else draw_sprite_ext(spr_optbox,!!over,x,y+4-(f/2),1,0+(f/8),0,c_white,1)
    if over>1 over=1
    tcol=$ffffff
    rcol=$8000
    if (room == ta_menu && global.levellist[stagepick.sel+1,2] == 1) {
        tcol=$808080
        rcol=$180060
    }
    if room!=ta_roster rect(0,y-f,500,f*2,rcol*over,1) over=0
    global.halign=1
    global.valign=1
    if (room==ta_menu && global.tasing) tcol=$f8
    draw_systext(x,y,lang("roster ready"),tcol,(f-2)/3)
    global.halign=0
    global.valign=0

}
