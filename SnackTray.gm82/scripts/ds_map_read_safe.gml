///ds_map_read_safe(map,str)
//makes sure its safe to read before attempting

var str,i,l;

str=string(argument[1])
l=string_length(str)
if (l mod 2 || !l) return 0

//only check first and last 16 characters for speed
for (i=1;i<=16;i+=1) if (!string_pos(string_char_at(str,i),"0123456789ABCDEF")) return 0
for (i=l;i>=l-16;i-=1) if (!string_pos(string_char_at(str,i),"0123456789ABCDEF")) return 0

ds_map_read(argument[0],str)
return 1
