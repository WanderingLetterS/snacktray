#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
thing=0
state=0
textframe=0

TFPsound=FMODSoundAdd(global.cache+"media\thanks_for_playing.ogg",0)

inst=FMODSoundPlay(TFPsound,0)
alarm[2]=195 //Up Date
alarm[0]=290 //end
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODSoundPlay(global.b8,0)
allblack=1
alarm[1]=60
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stopsfx(inst)
if (global.gamemode="classic" && !global.creditsroll) segafadeto(scoring)
else segafadeto(titlescreen)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
textframe=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (input_esc()) {
    stopsfx(inst)
    if (global.gamemode="classic" && !global.creditsroll) segafadeto(scoring)
    else segafadeto(titlescreen)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (allblack) {
    rect(-1,-1,401,225,c_black)
    exit;
}

thing+=0.5
wrap_val(thing,0,15)

if !(global.greenmode) {
    draw_sprite(spr_TFPbackground,0,0,0);
    draw_sprite_tiled_area(spr_TFPscrollpart,0,x,floor(thing),0,0,192,244,c_white,1);
} else {
    draw_sprite_ext(spr_TFPbackground,0,0,0,1,1,0,$00ff00,1);
    draw_sprite_tiled_area(spr_TFPscrollpart,0,x,floor(thing),0,0,192,244,$00ff00,1);
}

if !(shut_up_bitch) && !(shut_the_FUCK_up_bitch) && (state!=1) fr+=0.15 else fr=0
if (state==1) {
fr2+=0.15
if (fr2>=6) state=2
}
else if (state==3) {
fr3+=0.25
if (fr3>=6) state=0
}
wrap_val(fr,0,7)
if !(shut_the_FUCK_up_bitch) {
switch (state) {
case 0: draw_sprite(spr_TFPsonicloop1,floor(fr),0,0) break;
case 1: draw_sprite(spr_TFPsonicpoint,floor(fr2),0,0) break;
case 2: draw_sprite(spr_TFPsonicloop2,floor(fr),0,0) break;
case 3: draw_sprite(spr_TFPsonicretract,floor(fr3),0,0) break;
}
}
else draw_sprite(spr_TFPsonicshutup,0,0,0) //i think DaJumpJump Would enjoy redoing this sprite :eyes:

str=lang("tfp_1")
if (textframe>=1) str+="###"+lang("tfp_2")
if (textframe>=2) str+="###"+lang("tfp_3")
if (textframe>=3) str+="###"+lang("tfp_4")
if (textframe>=4) str+="###"+lang("tfp_5")
draw_omitext(2,3,str)
