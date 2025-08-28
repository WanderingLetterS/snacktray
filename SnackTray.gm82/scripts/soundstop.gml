///soundstop(name)
//stops a sound effect, regardless of skin type
var sfx,name,p;

p=string(p2)

with (globalmanager) {
    name="sfx_"+argument[0]+p
    if (skindat(name)) stopsfx(skindat(name+"inst"))
    name="snd_"+argument[0]
    if (skindat(name)) stopsfx(skindat(name+"inst"))
}
