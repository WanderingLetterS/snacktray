#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
initialy=y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x,y+1,player)
with (instance_place(x,y+1,player)) {

if !jump && place_meeting(x,y,other) && !other.notready hurtplayer("crush")
else {if unreal(other.spiked,0) hurtplayer("spike")}

}

if !(delay) {

if (notready) {
    y = approach_val(y,initialy, 0.5)

    if y==initialy notready=0

}
else
{
    elspeed=approach_val(elspeed,4,0.2)
    if !place_meeting(x,round(y)+1,collider) && !place_meeting(x,round(y)+1,x1F0) && !(ylimit && (y+1) >= initialy+(ylimit*16))
    {
        y += elspeed
    }else {
        if inview() sound("enemycrusher")
        elspeed=0
        notready=1
        delay=30
    }
}

} else delay=approach_val(delay,0,1)

//y=floor(y)

vsp=(floor(y)-1)-yprevious
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=real(width)
ylimit=real(ylimit)
image_yscale=1+sign(unreal(spiked,0))
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//chain
p=floor(y)-32
repeat (((y-16)-(initialy+8))/16) {
    draw_background_part(global.masterobjects[biome],184,272,16,16,x+(16*image_xscale/2)-8,p)
    p-=16
}
if (y-16>initialy) draw_background_part(global.masterobjects[biome],184,272+(min(16,16-((y-initialy) mod 16))),16,16-min(16,16-((y-initialy) mod 16)),x+(16*image_xscale/2)-8,initialy)

draw_background_part_ext(global.masterobjects[biome],184,288+16-(min(16,y-initialy)),16,ceil(min(16,y-initialy)),x+(16*image_xscale/2)-8,floor(y)-16+ceil(16-floor(min(16,y-initialy))),1,1,c_white,image_alpha)
draw_background_part_ext(global.masterobjects[biome],184,264,16,8,x+(16*image_xscale/2)-8,floor(initialy),1,1,c_white,image_alpha)

if image_xscale >= 2 {
    draw_background_part_ext(global.masterobjects[biome],168,304,16,16,x,floor(y),1,1,c_white,image_alpha) // left
    if image_xscale >= 3 {
        var i;
        i=1
        repeat(image_xscale-2) {
            draw_background_part_ext(global.masterobjects[biome],184,304,16,16,x+(16*i),floor(y),1,1,c_white,image_alpha) //middle
            i+=1;
        }
    }
    draw_background_part_ext(global.masterobjects[biome],200,304,16,16,x+16*(image_xscale-1),floor(y),1,1,c_white,image_alpha) // right

    if (unreal(spiked,0)) {
        draw_background_part_ext(global.masterobjects[biome],168,320,16,16,x,floor(y)+16,1,1,c_white,image_alpha) // left spike
        if image_xscale >= 3 {
            i=1
            repeat(image_xscale-2) {
                draw_background_part_ext(global.masterobjects[biome],184,320,16,16,x+(16*i),floor(y)+16,1,1,c_white,image_alpha) //middle spike
                i+=1;
            }
        }
        draw_background_part_ext(global.masterobjects[biome],200,320,16,16,x+16*(image_xscale-1),floor(y)+16,1,1,c_white,image_alpha) // right spike
    }
} else {
    draw_background_part_ext(global.masterobjects[biome],184,336,16,16,x,floor(y),1,1,c_white,image_alpha) // single tile
    if (unreal(spiked,0)) {
        draw_background_part_ext(global.masterobjects[biome],184,352,16,16,x,floor(y)+16,1,1,c_white,image_alpha) // single tile spike
    }
}
