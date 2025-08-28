///joysnap(joystick)
//takes a snapshot of the joystick

//axes
for (i=0;i<6;i+=1) joystate[0,i]=joy_get(argument[0],0,i)
//buttons
for (i=0;i<32;i+=1) joystate[1,i]=joy_get(argument[0],1,i)
//hat
joystate[2,0]=joy_get(argument[0],2,0)

joystate[3,0]=argument[0]
