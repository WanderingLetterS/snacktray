///keyvalid(key)
//This returns whether the given key is a valid input method

if ((argument[0]>=48 && argument[0]<=57) || (argument[0]>=65 && argument[0]<=90) || (argument[0]>=96 && argument[0]<=105)) return 1
switch (argument[0]) {
    case 8:
    case 9:
    case 13:
    case 16:
    case 17:
    case 20:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 45:
    case 46:
    case 106:
    case 107:
    case 109:
    case 110:
    case 111:
    case 186:
    case 187:
    case 188:
    case 189:
    case 190:
    case 191:
    case 193:
    case 219:
    case 220:
    case 221:
    case 222:
    case 226: return 1
}
return 0
