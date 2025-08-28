//add each tile to its respective bat-chan
lt=background_get_texture(global.master[biome])
luu=(1/background_get_width(global.master[biome]))*texture_get_width(lt)
lvv=(1/background_get_height(global.master[biome]))*texture_get_height(lt)

//The terrain must do the same

st=background_get_texture(global.masterterrain[biome])
suu=(1/background_get_width(global.masterterrain[biome]))*texture_get_width(st)
svv=(1/background_get_height(global.masterterrain[biome]))*texture_get_height(st)
//The objects too

ot=background_get_texture(global.masterobjects[biome])
ouu=(1/background_get_width(global.masterobjects[biome]))*texture_get_width(ot)
ovv=(1/background_get_height(global.masterobjects[biome]))*texture_get_height(ot)

//And of course, the decor.

tt=background_get_texture(global.masterdecor[biome])
tuu=(1/background_get_width(global.masterdecor[biome]))*texture_get_width(ot)
tvv=(1/background_get_height(global.masterdecor[biome]))*texture_get_height(ot)
