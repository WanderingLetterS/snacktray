if (keyboard_check_direct(vk_mouseback)) {
    if (!global.mousebacklock) {global.mousebacklock=1 return 1}
} else global.mousebacklock=0

return keyboard_check_pressed(vk_escape)
