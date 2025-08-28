///joycompare()
//compares the joystick snapshot with the current values so that we can detect inputs
var j; j=joystate[3,0]

//axes
for (i=0;i<6;i+=1) {get=joy_get(j,0,i) if (joystate[0,i]!=get) return "axis "+string(i)+string_repeat(" +",get=1)+string_repeat(" -",get=-1)+string_repeat(" *",get=0)}
//buttons
for (i=0;i<32;i+=1) {get=joy_get(j,1,i) if (joystate[1,i]!=get) return "button "+string(i)+string_repeat(" -",!get)}
//hat
get=joy_get(j,2,0) if (joystate[2,0]!=get) return "hat "+string(get)

return ""
