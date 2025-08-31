var ok,i;

if (room=lemon||room=worldlemon) exit

ok=!global.actually_recording_goddamnit && room!=lemon && room!=boot
for (i=0;i<global.mplay;i+=1) if (global.input[i]>=JOY) ok=1
if (ok) external_call(joyUpdate)

if (global.inputwait) global.inputwait-=1

//check all mapped keyboard keys every step so we don't have issues across rooms
for (i=0;i<12;i+=1) {
    global.keydirect[i,0]=keyboard_check_direct(global.key[i,0]) && global.focus
    global.keydirect[i,1]=keyboard_check_direct(global.key[i,1]) && global.focus
}
