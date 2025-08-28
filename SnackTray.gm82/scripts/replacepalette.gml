///replacepalette(slot,name,dir)
var name,slot,dir,amount,loopey,totpal;
name=argument[1]
slot=argument[0]
dir=argument[2]

if playerskindat(slot,"offersprays"+string(slot))=0 exit

my_directory=dir+name+"-palette.png"

if (current_time>global.loadtime+64) loadtext()

if (file_exists(dir+name+"-palette.png")) {
    global.palettesprites[slot]=sprite_add(my_directory,1,1,0,0,0)
    global.ogpalsprite[slot]=sprite_add(my_directory,1,1,0,0,0)
    //honestly i dont really understand why it's even trying to get it from shared in the first place, shit's weird as hell.
} else if string_count("_shared\",my_directory){
    my_directory=dir
    my_directory=string_delete(my_directory,string_pos("_shared\",my_directory),8)
    my_directory+=name+"\"+name+"-palette.png"
    global.palettesprites[slot]=sprite_add(my_directory,1,1,0,0,0)
    global.ogpalsprite[slot]=sprite_add(my_directory,1,1,0,0,0)
}
if !sprite_exists_0(global.palettesprites[slot]) ping(lang("error skin corrupt")+"#"+my_directory)


yeah=surface_create(sprite_get_width(global.palettesprites[slot]),sprite_get_height(global.palettesprites[slot]))
surface_set_target(yeah)
draw_sprite(global.palettesprites[slot],0,0,0)

amount=playerskindat(slot,"maxsizes"+string(slot))
totpal=playerskindat(slot,"totpal"+string(slot))+1

//bail out if the palette sprite can't be added or everything breaks
if (totpal > surface_get_width(yeah)) {
    surface_free(yeah)
    surface_reset_target()
    error(lang("error directx9"))
    playerskindat(slot,"offersprays"+string(slot),0)
    return 0
}
;
global.palettesprites[slot*100]=sprite_create_from_surface(yeah,9,9,totpal,16,0,0,0,0)
loopey=1
repeat (amount) {

    if (9+(totpal+1)*loopey > surface_get_width(yeah)) {
        surface_free(yeah)
        surface_reset_target()
        error(lang("error directx9"))
        playerskindat(slot,"offersprays"+string(slot),0)
        return 0
    }
    sprite_add_from_surface(global.palettesprites[slot*100],yeah,9+(totpal+1)*loopey,9,totpal,16,0,0) loopey+=1
}

surface_free(yeah)
surface_reset_target()
