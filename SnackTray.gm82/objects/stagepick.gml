#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scroll=0

over=0
no=0
mc=0
sel=0

image_speed=0

if (!global.stagecount) global.nextlevel=global.levellist[1,0]

str=global.nextlevel

view_xview[1]=433
view_yview[1]=9

mq=0
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
over=0
mc+=1 if (mc=10) {mc=0 mq+=1}
pickedlevel=global.levellist[sel,0]
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.stages!=2) {
    cx=other.x-x
    cy=other.y-y

    if (cx<114) {
        sel=median(scroll,min(global.levellist[0,0],floor((cy-4)/8)+scroll),scroll+6)
        sound("systemselect")
        mq=0
    }
    if (cx>=118) {
        if (cy>=32) scroll=max(0,min(scroll+2,global.levellist[0,0]-7))
        else scroll=max(0,min(scroll-2,global.levellist[0,0]-7))
        sound("systemselect")
    }
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.stages!=2) {
    cx=other.x-x
    cy=other.y-y

    if (cx>=118) over=1+(cy>=32)
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.stages!=2) {
    scroll=max(0,min(scroll+(other.wdown-other.wup)*2,global.levellist[0,0]-7))
    sound("systemselect")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.stages=2) {
    draw_sprite_ext(sprite_index,0,x,y,1,1,0,$ffffff,0.5)
} else {
    draw_sprite(sprite_index,0,x,y)

    if (sel=median(scroll,sel,scroll+6)) draw_sprite(sprite_index,3,x,y-2+8*(sel-scroll))

    str=""
    for (i=scroll;i<min(scroll+7,global.levellist[0,0]);i+=1) {
        if (global.levellist[i+1,2] == 1) str+="${c=$808080}"
        if (i=sel) str+=string_replace_all(marquee(replacebuttonnames(global.levellist[i+1,1]),13,mq),"#"," ")+"#"
        else str+=string_replace_all(string_copy(replacebuttonnames(global.levellist[i+1,1]),1,13),"#"," ")+"#"
    }
    draw_systext(x+4,y+4,str)

    if (over) draw_sprite(sprite_index,over,x,y)
}
