#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mouse_check_button(mb_left)) {
    if (mouse_check_button_pressed(mb_left)) image_index=1
    image_index=min(2,image_index+0.2)
} else if (mouse_check_button(mb_right)) {
    if (mouse_check_button_pressed(mb_right)) image_index=3
    image_index=min(4,image_index+0.2)
} else image_index=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_exists(moranboll)) exit

x=mouse_x
y=mouse_y

if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_middle)) {
    grabs=1
    memx=mouse_x
    memy=mouse_y
}

specialeghost.visible=0

if (grabs) {
    view_xview[0]=median(-256,memx-window_mouse_get_x(),2048-view_wview[0]+256)
    view_yview[0]=median(-256,memy-window_mouse_get_y(),2048-view_hview[0]+256)
    with (specialepal) {
        x=view_xview[0]+xstart+floor((view_wview[0]-1074)/2)
        y=view_yview[0]+view_hview[0]-51
    }
    with (specialemenu) {
        x=view_xview[0]+xstart+floor((view_wview[0]-1074)/2)
        y=view_yview[0]+ystart
    }
    x=view_xview[0]+window_mouse_get_x()
    y=view_yview[0]+window_mouse_get_y()
    if (!keyboard_check(vk_space) && !mouse_check_button(mb_middle)) grabs=0
} else {
    if (grab) {
        if (!position_meeting(round(mouse_x/32)*32,round(mouse_y/32)*32,specialeobj)) {
            grab.x=median(0,round(mouse_x/32)*32,2016)
            grab.y=median(0,round(mouse_y/32)*32,2016)
            if (grab.x!=memx || grab.y!=memy) moved=1
        }
        if (!mouse_check_button(mb_left)) {
            if (!moved) {
                with (grab) instance_destroy()
                with (instance_create(memx,memy,specialeobj)) image_index=specialectrl.cur
            }
            grab=0
        }
    } else if (mouse_y=median(view_yview[0]+50,mouse_y,view_yview[0]+view_hview[0]-120)) {
        specialeghost.visible=1
        if (mouse_check_button_pressed(mb_left)) {
            grab=instance_position(round(mouse_x/32)*32,round(mouse_y/32)*32,specialeobj)
            if (grab) {
                memx=grab.x
                memy=grab.y
                moved=0
            }
        } else if (mouse_check_button(mb_left)) {
            with (instance_position(round(mouse_x/32)*32,round(mouse_y/32)*32,specialeobj)) instance_destroy()
            if (round(mouse_x/32)*32=median(0,round(mouse_x/32)*32,2016) && round(mouse_y/32)*32=median(0,round(mouse_y/32)*32,2016))
                with (instance_create(round(mouse_x/32)*32,round(mouse_y/32)*32,specialeobj)) image_index=specialectrl.cur
        }

        if (mouse_check_button(mb_right)) {
            with (instance_position(round(mouse_x/32)*32,round(mouse_y/32)*32,specialeobj)) instance_destroy()
        }
    }
}
