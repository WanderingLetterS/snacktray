///drawlivestring():str
//lives text

if (global.lifes>255) return string_char_at("0123456789ABCDEF",1+floor(player.x/16) mod 16)+string_char_at("0123456789ABCDEF",1+floor(player.y/16) mod 16)
if (global.lifes>99) return string_char_at("0123456789ABCDEF",1+global.lifes div 16)+string_char_at("0123456789ABCDEF",1+global.lifes mod 16)
return string(global.lifes)
