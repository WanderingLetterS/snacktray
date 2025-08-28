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
flash=1

menumusic()

spritep[0]=2

f=240
rankcol[0]=$36b5f2
rankcol[1]=$f7eddd
rankcol[2]=$266bd5
flashcol=$DBDBFF

tascol=$ffffff

l = global.lskins[global.levelskin+1,0]
if (l == global.lbase) l = ""

studio = global.charname[global.option[0]]
tas=""
if global.wastasing {tas="tas_" tascol=$f8}

for (i=0;i<5;i+=1) {
    cname[i]=ta_set("ta_char_"+tas+string(i)+global.currentlevel+l)
    t[i]=floor(ta_set("ta_time_"+tas+string(i)+global.currentlevel+l) / 60)
    t2[i]=floor(ta_set("ta_time_"+tas+string(i)+global.currentlevel+l) * 1.66666667)
    mine[i]=0
    if ta_set("ta_time_"+tas+string(i)+global.currentlevel+l) == global.my_ta {
        mine[i]=1
        cheersound=1
    }
    pname[i]=ta_set("ta_pname_"+tas+string(i)+global.currentlevel+l)
    if string(pname[i]) == "0" pname[i] = ""
    cid[i]=charm_get_id(cname[i])
    timestring[i]=string(t[i] div 60)+"'"+format(t[i] mod 60,2)+"''"+format(t2[i] mod 100,2)
    dev[i]=ta_set("ta_dev_"+tas+string(i)+global.currentlevel+l)

    //boll team fire this man

    cnamechar[i]=ta_set("ta_char_"+tas+string(i)+global.currentlevel+l+studio) //LOL
    tchar[i]=floor(ta_set("ta_time_"+tas+string(i)+global.currentlevel+l+studio) / 60)
    t2char[i]=floor(ta_set("ta_time_"+tas+string(i)+global.currentlevel+l+studio) * 1.66666667)
    cmine[i]=0
    if ta_set("ta_time_"+tas+string(i)+global.currentlevel+l+studio) == global.my_ta {
        cmine[i]=1
        cheersound2=1
    }
    pnamechar[i]=ta_set("ta_pname_"+tas+string(i)+global.currentlevel+l+studio)
    if string(pnamechar[i]) == "0" pnamechar[i] = ""
    cidchar[i]=charm_get_id(cnamechar[i])
    timestringchar[i]=string(tchar[i] div 60)+"'"+format(tchar[i] mod 60,2)+"''"+format(t2char[i] mod 100,2)
    devchar[i]=ta_set("ta_dev_"+tas+string(i)+global.currentlevel+l+studio)
}

t[6] = global.my_ta / 60
t2[6] = global.my_ta * 1.66666666
timestring[6] = string(t[6] div 60)+"'"+format(t[6] mod 60,2)+"''"+format(t2[6] mod 100,2)

cheater = global.cheater + global.lowgrav + global.highgrav + global.fuzzy + global.debug + (global.my_ta<180)

if (cheater || !cheersound) alarm[2]=35
else alarm[3]=35
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
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("ta_epicfail")
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("ta_settime")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (advance()) if (fgo && showcharrecord && !cooldown) {
    segafadeto(mainmenu)
} else if (fgo && !showcharrecord && !cooldown) {
    cooldown=40
    showcharrecord=1
    if cheersound2 alarm[3]=2 else alarm[2]=2
    sound("systemselect")
}

if (fgo) f=lerp(f,0,0.0525)
cooldown-=1

frame4=(frame4+0.25) mod 4
showframe4=floor(frame4) mod 2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_border,0,0,0)
myplace=global.pipeplacement
if showcharrecord myplace=global.pipeplacement2
drawpodium(xstart-90,ystart+f,1,0,2,"",max(0,3-myplace))

global.halign=1
if cheater draw_systext(200+irandom_range(-1,1),48,lang("ta_cheater"),$2246FF)
else {
    draw_systext(200,40,lang("ta_results")+"##"+replacebuttonnames(global.levelname),tascol)
    global.halign=0
    draw_systext(254,56,lang("ta_yourtime")+lf+lf+" "+timestring[6]+lf+"  "+string(settings("ta_death")))
    draw_sprite(spr_resulticons,6,254,72)
    draw_sprite(spr_resulticons,8,254,80)
    draw_sprite(spr_charicondev,settings("Hi_im_dev"),328,72)
}

global.halign=2
draw_systext(326,96,lang("ta_time"+string(showcharrecord)+tas))
global.halign=0

for (i=0;i<5;i+=1) {

    if !showcharrecord {
        col=$808080
        if i<3 {
            draw_sprite(spr_ta_rank,i,352,112+(i*12))
            col=rankcol[i]
        }
        if mine[i] && flash {
            if showframe4 col=flashcol
        }
        draw_systext(190,112+(i*12),string(i+1)+".      "+timestring[i],col)
        draw_systext(214,112+(i*12),string(pname[i]),col)
        draw_sprite_ext(spr_resulticons,6,246,112+(i*12),1,1,0,col,1) //clock

        if cid[i] != -1 draw_sprite(global.chariconr[cid[i]],0,326,112+(i*12))
        else draw_sprite(spr_chariconb,0,326,112+(i*12))

        if dev[i]!= 0 draw_sprite(spr_charicondev,dev[i],338,112+(i*12))

    }

    else {
        col=$808080
        if i<3 {
            draw_sprite(spr_ta_rank,i,352,112+(i*12))
            col=rankcol[i]
        }

        if cmine[i] && flash {
            if showframe4 col=flashcol
        }
        draw_systext(190,112+(i*12),string(i+1)+".      "+timestringchar[i],col)
        draw_systext(214,112+(i*12),string(pnamechar[i]),col)
        draw_sprite_ext(spr_resulticons,6,246,112+(i*12),1,1,0,col,1) //clock

        if cidchar[i] != -1 draw_sprite(global.chariconr[cidchar[i]],0,326,112+(i*12))
        else draw_sprite(spr_chariconb,0,326,112+(i*12))

        if devchar[i]!= 0 draw_sprite(spr_charicondev,devchar[i],338,112+(i*12))

    }
}
