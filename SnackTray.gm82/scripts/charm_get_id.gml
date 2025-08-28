///charm_get_id(name):id

if (is_real(argument[0])) return -1

var i;
for (i=0;i<global.characters;i+=1) {
    if (global.charname[i]==argument[0]) return i
}
return -1
