var w,h;

if (room=roster) exit

w=window_get_region_width()
h=window_get_region_height()

global.loadtime=current_time
d3d_set_projection_ortho(0,0,w,h,0)
draw_sprite_ext(spr_loader,global.loadstate,16,h-16,2,2,0,$ffffff,1)
screen_refresh()
io_handle()
global.loadstate+=1
