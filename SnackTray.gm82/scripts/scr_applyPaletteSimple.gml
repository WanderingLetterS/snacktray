///scr_applyPaletteSimple(psPalSwapid,palettesprite,collumnto,totalpal)
var i,j,w,colorfrom,colorto;
w=sprite_get_width(argument[1])
shader_pixel_set(argument[0])


texture_set_stage("_gm_PaletteTexture",sprite_get_texture(argument[1],0))

shader_pixel_uniform_f("_paletteID",argument[2])
shader_pixel_uniform_f("_totalPaletteWidth",argument[3])
