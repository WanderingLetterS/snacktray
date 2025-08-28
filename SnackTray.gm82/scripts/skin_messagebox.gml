//applies skin to show_message
var s,w,h,bg;

w=sprite_get_width(spr_msgbg)
h=sprite_get_height(spr_msgbg)
s=sureface("",w,h)
if (!sureface_set_target("")) exit
draw_sprite(spr_msgbg,0,0,0)
surface_reset_target()
bg=background_create_from_surface(s,0,0,w,h,0,0)
sureface_free("")
message_background(bg)
message_size(-1,-1)
message_text_font("MS Sans Serif",10,$ffffff,1)
message_button(spr_msgbutton)
message_button_font("MS Sans Serif",10,$ffffff,1)
message_input_color($8000)
message_input_font("MS Sans Serif",10,$ffffff,1)
