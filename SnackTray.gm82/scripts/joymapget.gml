///joymapget(joy,input)
//gets joystick input based on previously unpacked mappings
var type,reading,expected;

type=joykey[argument[1],0]
reading=joy_get(argument[0],type,joykey[argument[1],1])
expected=joykey[argument[1],2]

//pov hats have different treatment due to being 8-directional and having a center value
if (type=2) return (abs(anglediff(reading,expected))<50 && reading!=-1)

return reading==expected && global.focus
