///replacesheet(slot,texname,file,expected width,expected height,removeback)
//replace a skin sheet, checking dimensions
//if dimensions are 0 it doesn't check
var spr,spro,name,i;

if (current_time>global.loadtime+64) loadtext()

name="tex_"+argument[1]+string(argument[0])       

if !(file_exists(argument[2])){
    for (i=0;i<global.biomes;i+=1) {
        if string_count(global.biome[i],argument[2])=1{
            argument[2]=string_delete(argument[2],string_pos(global.biome[i],argument[2]),string_length(global.biome[i])+1)
            
        }
    }
}
if (file_exists(argument[2])) {   
    if !global.reloadallsheets
    if (argument[2]=string(skindat(name+"_filename"))) return skindat(name)
    
    skindat(name+"_transp",argument[5])
    spr=sprite_add(argument[2],1,argument[5],0,0,0)
    if (spr) {
        if (texture_get_width(sprite_get_texture(spr,0))>1 || texture_get_height(sprite_get_texture(spr,0))>1) {
            error(lang("error skin thicc")+"##"+argument[2])
            sprite_delete(spr)
            return -1
        }
        if ((argument[3] && sprite_get_width(spr)!=argument[3]) || (argument[4] && sprite_get_height(spr)!=argument[4]))
            show_debug_message(lang("error skin dimensions")+" "+string_replace(string_replace(argument[2],global.cache,""),global.workdir,"")+"("+string(argument[3])+"x"+string(argument[4])+")")
        spro=skindat(name)
        if (spro) sprite_delete(spro)
        skindat(name,spr)
        skindat(name+"_filename",argument[2])
        return spr
    }
    ping(lang("error skin corrupt")+"#"+argument[2])
}

return -1
