#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=180
f=0
go=0
time1=0
time2=0
frame1=0
frame2=0
blink=40
triangel=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
go=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    f=min(1,f+0.04)
    x=lerp(-40,global.screenwidth/2,sqr(f))
    y=ystart+64-cos((1-x/200)*pi/2)*64
    if (f=1) {
        time1+=0.2
        frame1=floor(time1 mod 6)

        time2+=0.2
        frame2=floor(time2)
        if (frame2>blink) {
            time2=0
            blink=irandom_range(8,40)
            introslide2.blink+=10
        }
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index!=spr_garf
{
if ((frame1 mod 3)=2) draw_sprite(sprite_index,4,x,y)
else if (frame1<2) draw_sprite(sprite_index,3,x,y)
else draw_sprite(sprite_index,5,x,y)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)
if (frame2=1 || frame2=3) draw_sprite(sprite_index,1,x,y)
if (frame2=2) draw_sprite(sprite_index,2,x,y)
