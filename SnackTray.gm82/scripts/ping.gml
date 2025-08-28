///ping(message)
//uses a message object to display a floating notification

if (argument[0]="") exit

with (message) instance_destroy()

if (room=lemon) {show_message(argument[0]) exit}

with (instance_create(0,0,message)) {
    str=argument[0]
    alarm[1]=1
}
