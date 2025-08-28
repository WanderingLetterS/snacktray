var f,spr,w,h,p,a,b;

f=file_find_first(argument[0]+"font*.png",0)

if (f!="") {
    spr=sprite_add(argument[0]+f,1,1,0,0,0)
    w=sprite_get_width(spr)
    h=sprite_get_height(spr)

    if (w mod 16 || h mod 16) {sprite_delete(spr) error(lang("error skin dimensions")+"##"+argument[0]+f) exit}

    if (global.sprfont!=-1) sprite_delete(global.sprfont)

    global.sprfont=spr
    global.sprfontu=w div 16
    global.sprfontv=h div 16

    p=string_pos("x",f)
    if (p) {
        a=string_digits(string_copy(f,1,p-1))
        b=string_digits(string_delete(f,1,p))
        global.sprfontw=unreal(a,8)
        global.sprfonth=unreal(b,8)
    } else {
        global.sprfontw=8
        global.sprfonth=8
    }
}
