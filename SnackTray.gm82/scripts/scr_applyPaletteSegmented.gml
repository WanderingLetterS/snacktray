///scr_applyPaletteSegmented(psPalSwapid,palette sprite,collumn1,collumn2,collumn3,collumn4,xoffset,totalpal)
var i,j,w,colorfrom,colorto;

w=argument[7]
shader_pixel_set(argument[0])


texture_set_stage("_gm_PaletteTexture",sprite_get_texture(argument[1],argument[6]))

shader_pixel_uniform_f("_paletteID_1",argument[2])
shader_pixel_uniform_f("_paletteID_2",argument[3])
shader_pixel_uniform_f("_paletteID_3",argument[4])
shader_pixel_uniform_f("_paletteID_4",argument[5])
shader_pixel_uniform_f("_totalPaletteWidth",argument[7])
