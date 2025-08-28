gamemanager.borda=0
pause=0 appsurf_update(0) pause=1
pausespr=sprite_create_from_surface(globalmanager.appsurf,0,0,global.w,global.h,0,0,0,0)
pausetex=skindat("tex_pause")
pausetexw=sprite_get_width(pausetex)
pausetexh=sprite_get_height(pausetex)
skey=1
slok=1
input_keystates()
room_speed=20
mus_pause(1)
external_call(global.dll_enablesave)
global.powersave=1
soundstop("systemtimecount")
with (player) {
    if (skidding) {soundstop(name+"skid") skidding=0}
    if (soundinst) FMODInstanceSetPause(soundinst,1)
}

if (settings("musbalance")=0 && pl=0) pl=-1

instance_deactivate_all(1)
instance_activate_object(globalmanager)
instance_activate_object(green_demon)
instance_activate_object(global.screen_manager)
//instance_activate_object(frameskipper)
