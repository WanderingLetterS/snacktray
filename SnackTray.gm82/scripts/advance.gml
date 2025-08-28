///advance()
//detects if the screen is being confirmed and should advance

if ((instance_exists(message) && object_index!=message) || instance_exists(console)) return 0

if (room=boot) return anykey()

input_get(-1)

if (akey || skey) return 1

return 0
