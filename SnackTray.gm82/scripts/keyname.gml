///keyname(key)
//This attempts to return a meaningful name for the given key code

if (argument[0]=vk_nokey) return "unassigned"
if (argument[0]>=48 && argument[0]<=57) return string(argument[0]-48)
if (argument[0]>=65 && argument[0]<=90) return string_upper(chr(argument[0]))
if (argument[0]>=96 && argument[0]<=105) return "num"+string(argument[0]-96)
switch (argument[0]) {
    case 8: return "backspace"
    case 9: return "tab"
    case 13: return "enter"
    case 16: return "shift"
    case 17: return "control"
    case 20: return "caps"
    case 32: return "space"
    case 33: return "pgup"
    case 34: return "pgdown"
    case 35: return "end"
    case 36: return "home"
    case 37: return "left"
    case 38: return "up"
    case 39: return "right"
    case 40: return "down"
    case 45: return "insert"
    case 46: return "delete"
    case 106: return "num*"
    case 107: return "num+"
    case 109: return "num-"
    case 110: return "num."
    case 111: return "num/"
    case 223: return "backtick"
}
return string(argument[0])
