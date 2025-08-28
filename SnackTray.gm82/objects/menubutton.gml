#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (sub==11) {
    if (settings("fullscreen")) y=-100
    else y=ystart
}
if (sub==13 || sub==18) {
    if (settings("fullscreen")) sub=18
    else sub=13
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sub=0) editnew(1)
//quickload
if (sub=2) editsave()
if (sub=5) editexit()
if (sub=6) edittest(0)
if (sub=7) edittime()
if (sub=8) editname()
if (sub=9) editdesc()
if (sub=11) editwindowsize()
if (sub=12) editskin()
if (sub=13 || sub=18) editfullscreen()
//quicksave
if (sub=15) editundo()
if (sub=22) editbeat() //good news! finally after all these years the one annoying spot in lemon is being filled
if (sub=23) editlightlevel() //dark areas
if (sub=24) editfakesave() //test for save errors
if (sub=25) editlevelskin()
if (sub=26) editmusic()
if (sub=27) {
    i=show_contextmenu("Lemon Settings|-|Toggle Fun Mode|Toggle Lemon Sounds|Toggle Lemon Music",0)
    if (i=1) settings("funmode",!settings("funmode"))
    if (i=2) settings("nolemonsound",!settings("nolemonsound"))
    if (i=3) {mus_stop() settings("nolemonmusic",!settings("nolemonmusic")) menumusic()}

}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
draw_sprite_ext(spr_editoricons,sub,x+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editoricons,sub - ((sub == 24)*22),x+7,y+7)
if (sub=2 && !drawregion.unchanged) draw_sprite(spr_editoricons,17,x+15,y-1)

if (over) {
    if (sub=0) drawtooltip(bbox_left,97,"New File",0)
    //quickload is 1
    if (sub=2) drawtooltip(bbox_left,97,"Save",0)
    if (sub=5) drawtooltip(bbox_right,97,"Quit",2)
    if (sub=6) drawtooltip(bbox_left,97,"Play (F5)",0)
    if (sub=7) drawtooltip((bbox_left+bbox_right)/2,97,"Time:#"+string(lemongrab.time),1)
    if (sub=8) drawtooltip((bbox_left+bbox_right)/2,97,"Name:#"+replacebuttonnames(lemongrab.levelname),1)
    if (sub=9) drawtooltip((bbox_left+bbox_right)/2,97,"Description:#"+replacebuttonnames(lemongrab.leveldesc),1)
    if (sub=11) drawtooltip(bbox_right,97,"Window Size",2)
    if (sub=12) drawtooltip(bbox_right,97,"Skin:#"+skinstr("name"),2)
    if (sub=13) drawtooltip(bbox_right,97,"Fullscreen",2)
    //quicksave is 14
    if (sub=15) drawtooltip(bbox_left,97,"Undo",0)
    //undo is 16
    if (sub=18) drawtooltip(bbox_right,97,"Windowed",2)

    if (sub=22) drawtooltip((bbox_left+bbox_right)/2,97,"Beep Block# Behavior",2)
    if (sub=23) drawtooltip((bbox_left+bbox_right)/2,97,"Region Darkness:#"+string(lemongrab.lightlevel[drawregion.region]),2)
    if (sub=24) drawtooltip(bbox_left,97,"Simulate Save Error",0)
    if (sub=25) drawtooltip(bbox_left,97,"Level Skin:#"+string(global.lemonlskin),0)
}
