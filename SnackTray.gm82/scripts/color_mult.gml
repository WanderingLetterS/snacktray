return make_color_rgb(
    (color_get_red(argument[0])*color_get_red(argument[1]))/255,
    (color_get_green(argument[0])*color_get_green(argument[1]))/255,
    (color_get_blue(argument[0])*color_get_blue(argument[1]))/255
)
