#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//This should be simple for now.

line=0
tile="start"
frn=1
frame=0
event="0"
data="world11"
lvlid=0
height=1
width=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    global.size[0]=(gamemanager.players[0]).size
    global.size[1]=(gamemanager.players[1]).size
    global.size[2]=(gamemanager.players[2]).size
    global.size[3]=(gamemanager.players[3]).size
    global.size[4]=(gamemanager.players[4]).size
    global.size[5]=(gamemanager.players[5]).size
    global.size[6]=(gamemanager.players[6]).size
    global.size[7]=(gamemanager.players[7]).size
    global.size[8]=(gamemanager.players[8]).size
    global.size[9]=(gamemanager.players[9]).size
    global.nextlevel=string(data)
    global.noworldmap=1
    global.firstlevel=0
    game_stageend()
    global.wmap_spawny=y
    global.wmap_spawnx=x
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Find the animation and gather the data
//Comical


if unreal(event,0)=1{//If it's a level then
    if settings("save_"+string(global.saveslot)+" "+data+"clear") tile+="clear"

    for (i=1;i<global.levellist[0,0];i+=1){   
        if global.levellist[i,0] =string(data) { lvlid=i break;}
        i+=1
    } 
}
for (line=0;line<=global.wm_lineamount;line+=1) {
    for (i=0;i<global.wm_line[line,3];i+=1) {
        if (global.wm_line[line,4+i]=tile) {
                frame=0
                frn=global.wm_line[line,0]
                frs=global.wm_line[line,2]
                frl=global.wm_line[line,1]
                off_x=i*frn
                width=global.wm_lineexdata[line,0]
                height=global.wm_lineexdata[line,1]
                
                if frn<=1 {
                    for (i=0;i<width;i+=1){
                        for (j=0;j<height;j+=1){
                            tile_dyn(global.minimapsheet[biome],8+off_x*17+(17 *(off_x*(width-1 +height-1)+j +(i*width))),71+line*17,16,16,x-(8*(width-1))+(16 *i),y-(16 *j),depth)
                        }
                    }
                } else static_leftoffset=+off_x*17+(17 *(off_x*(width-1 +height-1)+j +(i*width)))
                
                exit
        }
    }
}

if settings("save_"+string(global.saveslot)+" locklevel_"+data){event=0}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Trigger an event

//The events should be:
//0-locked :( (Does nothing, so no code lmao)
//1-Level Start
//2-Shop
//3-Teleport(pipe)
//4-Teleport (instant)
//5-Teleport reciever (Doesn't do anything, it's just for one way pipe targets.) Has no code here.
switch (unreal(event,0)){

    case 4: //Left untested, might be broken as FUCK
        with minimap_player{
            x=other.target.x
            y=other.target.y
        }
    break;
    case 3:  with minimap_player {
        pipeid=other.id
        t=other.target
        piped=1
        pipe=2
    } break;
    case 2:
        //HEy listen man I'm not done yet with the shop, chill out.
    break;
    case 1:
         alarm[0]=60
        with minimap_player{starting=1}
    break;

}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if frn>1{

    frame+=frs
    if (frame>=frn) {frame=frame-frn if (frl<frn) frame+=frl}
    frame=modulo(precise(frame),0,frn)




    i=0 j=0
    for (i=0;i<width;i+=1){
        for (j=0;j<height;j+=1){
            draw_background_part(global.minimapsheet[biome],floor(8+floor(frame)*17+static_leftoffset),floor(71+line*17),16,16,floor(x-(8*(width-1))+(16 *i)),floor(y-(16 *j)))
        }
    }
}

if object_index!=worldmap_tile exit
if string(event)="1"{
    if collision_circle(x+8,y+8,16,minimap_player,0,1){
        depth=-99
        draw_sprite_ext(spr_levelthumbnail,0,x+8,y,1,1,0,c_white,1)
        if unreal(settings("rr1" + string(data)),0)==1 draw_sprite_ext(spr_lvlthumbredring,0,x+8,y,1,1,0,c_white,1)
        if unreal(settings("rr5" + string(data)),0)==1 draw_sprite_ext(spr_lvlthumbredring,4,x+8,y,1,1,0,c_white,1)
        if unreal(settings("rr2" + string(data)),0)==1 draw_sprite_ext(spr_lvlthumbredring,1,x+8,y,1,1,0,c_white,1)
        if unreal(settings("rr4" + string(data)),0)==1 draw_sprite_ext(spr_lvlthumbredring,3,x+8,y,1,1,0,c_white,1)
        if unreal(settings("rr3" + string(data)),0)==1 draw_sprite_ext(spr_lvlthumbredring,2,x+8,y,1,1,0,c_white,1)
        global.halign=1
        draw_omitext(x+8,y-16,replacebuttonnames(global.levellist[lvlid,1]),c_white,1)
        global.halign=0

    } else depth =0
}
