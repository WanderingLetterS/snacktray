///segafadeto(room,[sound])

if (room=game && skindat("nofade")) {
    room_goto_safe(argument[0])
    return 1
}

if (!instance_exists(segafade)) {
    if (argument_count=2) sound(argument[1])
    with (instance_create(0,0,segafade)) goto=argument[0]
    return 1
}

return 0
