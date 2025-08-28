//returns if you can floodfill this object

if (keyboard_check(vk_control) && keyboard_check(vk_shift)) return 1

switch (argument[0]) {
    case pipeblock:
    case sidepipe:
    case theothersidepipe:
    case downpipe:
    case heaven:
    case flagpole:
    case checkpoint:
    case droptarget:
    case spawncancel:
    case cannon:
    case slopel1:
    case sloper1:
    case slopel2:
    case sloper2:
    case bridge:
    case bowserboss:
    case mark:
    case platform:
    case tyler:
    case terraintyler:
    case objectstyler:
    case decortyler:
    case textblock:
    case anchor:
    case retainer:
    case slopel1s:
    case sloper1s:
    case slopel2s:
    case sloper2s:
    return 0
}
return 1
