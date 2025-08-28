///joy_get(joy,type,index)
//returns joystick state

if (argument[1]=0) return deadzone(external_call(globalmanager.joyAxis,argument[0],argument[2]))
if (argument[1]=1) return external_call(globalmanager.joyButton,argument[0],argument[2])
if (argument[1]=2) return external_call(globalmanager.joyHat,argument[0],argument[2])
if (argument[1]=3) return string(external_call(globalmanager.joyName,argument[0]))
