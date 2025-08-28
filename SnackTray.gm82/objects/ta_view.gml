#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=30
alarm[1]=60
img=0
imggo=0
fgo=0

spritep[0]=2

f=240
rankcol[0]=$36b5f2
rankcol[1]=$f7eddd
rankcol[2]=$266bd5

lvl = global.levellist[stagepick.sel+1,0]
lvlname = global.levellist[stagepick.sel+1,1]

l = global.lskins[global.levelskin+1,0]
if (l == global.lbase) l = ""

maxtime=(9 * 60 * 60) + (59 * 60) + (99 / 1.66666666)

studio = global.charname[global.option[0]]
tas=""
if global.tasing tas="tas_"

for (i=0;i<5;i+=1) {
    cname[i]=ta_set("ta_char_"+tas+string(i)+lvl+l)
    if !ta_set("ta_time_"+tas+string(i)+lvl+l) ta_set("ta_time_"+tas+string(i)+lvl+l,maxtime)
    t[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l) / 60)
    t2[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l) * 1.66666667)
    pname[i]=ta_set("ta_pname_"+tas+string(i)+lvl+l)
    if string(pname[i]) == "0" pname[i] = ""
    cid[i]=charm_get_id(cname[i])
    timestring[i]=string(t[i] div 60)+"'"+format(t[i] mod 60,2)+"''"+format(t2[i] mod 100,2)
    dev[i]=ta_set("ta_dev_"+tas+string(i)+lvl+l)

    //boll team fire this man

    cnamechar[i]=ta_set("ta_char_"+tas+string(i)+lvl+l+studio) //LOL
    if !ta_set("ta_time_"+tas+string(i)+lvl+l+studio) ta_set("ta_time_"+tas+string(i)+lvl+l+studio,maxtime)
    tchar[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l+studio) / 60)
    t2char[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l+studio) * 1.66666667)
    pnamechar[i]=ta_set("ta_pname_"+tas+string(i)+lvl+l+studio)
    if string(pnamechar[i]) == "0" pnamechar[i] = ""
    cidchar[i]=charm_get_id(cnamechar[i])
    timestringchar[i]=string(tchar[i] div 60)+"'"+format(tchar[i] mod 60,2)+"''"+format(t2char[i] mod 100,2)
    devchar[i]=ta_set("ta_dev_"+tas+string(i)+lvl+l+studio)
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fgo=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (imggo) imggo=-1
else imggo=1
alarm[1]=180
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lvl != global.levellist[stagepick.sel+1,0] || l != global.lskins[global.levelskin+1,0]) event_user(1)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lvl = global.levellist[stagepick.sel+1,0]
lvlname = global.levellist[stagepick.sel+1,1]

l = global.lskins[global.levelskin+1,0]
if (l == global.lbase) l = ""

studio = global.charname[global.option[0]]
tas=""
if global.tasing tas="tas_"

for (i=0;i<5;i+=1) {
    cname[i]=ta_set("ta_char_"+tas+string(i)+lvl+l)
    if !ta_set("ta_time_"+tas+string(i)+lvl+l) ta_set("ta_time_"+tas+string(i)+lvl+l,maxtime)
    t[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l) / 60)
    t2[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l) * 1.66666667)
    pname[i]=ta_set("ta_pname_"+tas+string(i)+lvl+l)
    if string(pname[i]) == "0" pname[i] = ""
    cid[i]=charm_get_id(cname[i])
    timestring[i]=string(t[i] div 60)+"'"+format(t[i] mod 60,2)+"''"+format(t2[i] mod 100,2)
    dev[i]=ta_set("ta_dev_"+tas+string(i)+lvl+l)

    //boll team fire this man

    cnamechar[i]=ta_set("ta_char_"+tas+string(i)+lvl+l+studio) //LOL
    if !ta_set("ta_time_"+tas+string(i)+lvl+l+studio) ta_set("ta_time_"+tas+string(i)+lvl+l+studio,maxtime)
    tchar[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l+studio) / 60)
    t2char[i]=floor(ta_set("ta_time_"+tas+string(i)+lvl+l+studio) * 1.66666667)
    pnamechar[i]=ta_set("ta_pname_"+tas+string(i)+lvl+l+studio)
    if string(pnamechar[i]) == "0" pnamechar[i] = ""
    cidchar[i]=charm_get_id(cnamechar[i])
    timestringchar[i]=string(tchar[i] div 60)+"'"+format(tchar[i] mod 60,2)+"''"+format(t2char[i] mod 100,2)
    devchar[i]=ta_set("ta_dev_"+tas+string(i)+lvl+l+studio)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.halign=1
draw_systext(200,28,lang("gamemode timeattack"))
draw_systext(200,40,replacebuttonnames(lvlname))

global.halign=0
draw_systext(190-136,96-16,lang("ta_time"+string(showcharrecord)+tas))

//i really Dont care about properly getting the new positions of the stuff so its just gonna All have -[number] in front of them

for (i=0;i<5;i+=1) {

    if !showcharrecord {
        col=$808080
        if i<3 {
            draw_sprite(spr_ta_rank,i,352-136,112-16+(i*12))
            col=rankcol[i]
        }
        draw_systext(190-136,112-16+(i*12),string(i+1)+".      "+timestring[i],col)
        draw_systext(214-136,112-16+(i*12),string_upper(string(pname[i])),col)
        draw_sprite_ext(spr_resulticons,6,246-136,112-16+(i*12),1,1,0,col,1) //clock

        if cid[i] != -1 draw_sprite(global.chariconr[cid[i]],0,326-136,112-16+(i*12))
        else draw_sprite(spr_chariconb,0,326-136,112-16+(i*12))

        if dev[i]!= 0 draw_sprite(spr_charicondev,dev[i],338-136,112-16+(i*12))

    }

    else {
        col=$808080
        if i<3 {
            draw_sprite(spr_ta_rank,i,352-136,112-16+(i*12))
            col=rankcol[i]
        }
        draw_systext(190-136,112-16+(i*12),string(i+1)+".      "+timestringchar[i],col)
        draw_systext(214-136,112-16+(i*12),string_upper(string(pnamechar[i])),col)
        draw_sprite_ext(spr_resulticons,6,246-136,112-16+(i*12),1,1,0,col,1) //clock

        if cidchar[i] != -1 draw_sprite(global.chariconr[cidchar[i]],0,326-136,112-16+(i*12))
        else draw_sprite(spr_chariconb,0,326-136,112-16+(i*12))

        if devchar[i]!= 0 draw_sprite(spr_charicondev,devchar[i],338-136,112-16+(i*12))

    }
}
