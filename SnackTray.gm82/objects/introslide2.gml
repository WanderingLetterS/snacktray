#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=180
f=0
go=0
blink=40
hand=30
time1=0
time2=0
frame1=0
frame2=0
tail=0
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
    x=lerp(global.screenwidth+40,global.screenwidth/2,sqr(f))
    y=ystart+64-cos((1-x/200)*pi/2)*64

    if (f=1) {
    tail2+=0.2
    if tail2=2
    {
    tail+=1
    tail2=0
    }
    if (tail>4) {
    tail=0
    }
        time1+=0.2
        frame1=floor(time1)
        if (frame1>hand) {
            time1=0
            hand=irandom_range(20,60)
        }

        time2+=0.2
        frame2=floor(time2)
        if (frame2>blink) {
            time2=0
            blink=irandom_range(30,50)
            introslide1.blink+=10
        }
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index!=spr_tails
{
if (frame1=9 || frame1=11 || frame1=13 || frame1=15) draw_sprite(sprite_index,4,x,y)
else if (frame1=10 || frame1=14) draw_sprite(sprite_index,5,x,y)
else draw_sprite(sprite_index,3,x,y)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=spr_tails
{
draw_sprite(sprite_index,3+tail,x+9,y)
}
draw_sprite(sprite_index,0,x,y)
if (frame2=1 || frame2=4) draw_sprite(sprite_index,1,x,y)
if (frame2=2 || frame2=3) draw_sprite(sprite_index,2,x,y)
