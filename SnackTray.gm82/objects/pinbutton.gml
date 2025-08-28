#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (worldskinlist.tab=0) {
    if (settings("wskinpin")!="") settings("wskinpin","")
    else if (global.worldskin) settings("wskinpin",global.wskins[global.worldskin+1,0])
}
if (worldskinlist.tab=1) {
    if (settings("mskinpin")!="") settings("mskinpin","")
    else if (global.musicskin) settings("mskinpin",global.mskins[global.musicskin+1,0])
}
if (worldskinlist.tab=2) {
    if (settings("lskinpin")!="") settings("lskinpin","")
    else if (global.levelskin) settings("lskinpin",global.lskins[global.levelskin+1,0])
}

saveopt()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
if (worldskinlist.tab=0) {
    if (settings("wskinpin")!="") image_index=1
}
if (worldskinlist.tab=1) {
    if (settings("mskinpin")!="") image_index=1
}
if (worldskinlist.tab=2) {
    if (settings("lskinpin")!="") image_index=1
}
draw_self()
