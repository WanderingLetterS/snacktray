///drawmoviehud()
//draws movie hud icons when applicable

d3d_transform_stack_push()
if (skindat("left")) {
    d3d_transform_add_scaling(-1,1,1)
    d3d_transform_add_translation(x+400-1,y,0)
} else d3d_transform_add_translation(x,y,0)
if (global.debug || global.showbuttons || global.showfps || (global.playback && !global.hidereplayui)) { //movie status icons
    d3d_transform_add_translation((400-256)/2,0,0)
    if (global.playback) {
        percent=format(floor(((global.pos-1)/global.length)*100),2)
        if (string_length(percent)=3) percent="--"
        tim=(global.length-(global.pos-1))/global.mplay/60
        draw_sprite(spr_movietime,(stop && !flag.yup),204,193)
        draw_systext(208+16,197,percent+"%")
        draw_systext(208,197+12,format(floor(tim/60),2)+":"+format(floor(tim) mod 60,2))
    }
    if (global.showfps) {
        draw_systext(0,2,"FPS: "+string_format(global.pfps,3,1))
    }
    if (global.showbuttons || global.debug) {
        draw_set_color($ffffff)
        draw_sprite(spr_buttons,0,4,197)
        if (players[view_current].left ) draw_sprite(spr_buttons,1,4,197)
        if (players[view_current].right) draw_sprite(spr_buttons,2,4,197)
        if (players[view_current].up   ) draw_sprite(spr_buttons,3,4,197)
        if (players[view_current].down ) draw_sprite(spr_buttons,4,4,197)
        if (players[view_current].akey ) draw_sprite(spr_buttons,5,4,197)
        if (players[view_current].bkey ) draw_sprite(spr_buttons,6,4,197)
        if (players[view_current].ckey ) draw_sprite(spr_buttons,7,4,197)
        if (players[view_current].xkey ) draw_sprite(spr_buttons,8,4,197)
        if (players[view_current].ykey ) draw_sprite(spr_buttons,9,4,197)
        if (players[view_current].zkey ) draw_sprite(spr_buttons,10,4,197)
        if (players[view_current].skey ) draw_sprite(spr_buttons,11,4,197)
    }
}
d3d_transform_stack_pop()
