#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if (open) {depth=-9 f=min(2,f+0.04) if (distance_to_object(nearestplayer())>128) open=0}
else {depth=2 f=max(0,f-0.04)}

if (trans) {
    sf+=0.05
    trans+=1
    if (trans=20) {
        trans=0
        sf=0
        cur+=1
    }
}

if (f<1) ff=sin(f*pi/2)
else ff=f-1

if (f=2) frame=global.frame8
else frame=0
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//lets cut the text into pages

global.tcalc=1

pages=0

text+="\"
p=string_pos("\",text)
while (p) {
    page[pages]=wordwrap(string_copy(text,1,p-1),48)
    draw_skintext(0,0,page[pages],0,0)
    w[pages]=maxx+16
    h[pages]=maxy+16
    text=string_delete(text,1,p)
    p=string_pos("\",text)
    pages+=1
}

global.tcalc=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (f>0 && f<1) {
    dw=w[cur]
    dh=h[cur]
    rect(x+4-4*ff,y+4+(-4-dh)*ff,8+8*ff,8+8*ff,$ffffff,1)
    rect(x+4-4*ff+1,y+4+(-4-dh)*ff+1,8+8*ff-2,8+8*ff-2,0,1)
}
ssw_tile("talkbox")
if (f>=1) {
    dw=lerp(w[cur],w[cur+1],sf)
    dh=lerp(h[cur],h[cur+1],sf)
    rect(x-(dw/2-8)*ff,y-dh,16+(dw-16)*ff,16+(dh-16)*ff,$ffffff,1)
    rect(x-(dw/2-8)*ff+1,y-dh+1,16+(dw-16)*ff-2,16+(dh-16)*ff-2,0,1)
    if (f=2 && !trans) draw_skintext(x-dw/2+16,y-dh+8,page[cur])
}
