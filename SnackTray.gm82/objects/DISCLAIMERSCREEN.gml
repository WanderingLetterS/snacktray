#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_alpha=0
image_speed=0
image_index=0
room_goto_next()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if fade
{
image_alpha += 0.05
}
if (!lok) {
    if (advance() || anykey()) {
        if (!clicc) {
            clicc=1
            lok=1
            segafadeto(titlescreen,"systemgo")
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fade=1
mus_stop()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self();

wrap_val(thing,0,7)
draw_sprite(DISCLAIMERSCREENspr2,floor(thing),x,y)
thing+=0.5

/*
global.halign=1
draw_systext(200,42,'Boll Deluxe "Old Engine" has been discontinued.###No further support is planned for this version.###Expect bugs, jank, and unfinished content.###Thanks for all the support,##and see you in Mario & Sonic Boll 2,##the sequel to Sonic Boll & Boll Deluxe!####Press any key to continue.')
