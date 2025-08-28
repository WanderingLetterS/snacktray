#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
langs[0]=1
langs[1]=""
clang=settings("language")
f=file_find_first("mods\language\*.txt",0)
while (f!="") {
    if (f!="example.txt") {
        if (f=clang) langc=langs[0]
        langs[0]+=1
        langs[langs[0]]=f
    }
    f=file_find_next()
}
file_find_close()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (langs[0]) {
    langc=modulo(langc+1,0,langs[0])
    settings("language",langs[langc+1])
    setlang()
    sound("systemselect")
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (langs[0]) {
    langc=modulo(langc-1,0,langs[0])
    settings("language",langs[langc+1])
    setlang()
    sound("systemselect")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over,x,y)
global.halign=1
global.valign=1
draw_systext(x,y,lang("name"))
global.halign=0
global.valign=0
over=0
