///room_goto_safe(room)
//makes sure it's safe to change rooms before doing so
if (!globalmanager.fadekill && !global.kill) {
    instance_activate_all()
    if (global.lemontest && room!=lemon && room!=change && argument[0]!=change) room_goto(lemon)
    else room_goto(argument[0])
    global.restarting=0
}
