#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound("systemselect")
/*if (global.modded) ping("Exporting assets requires vanilla game!")
else {
    mem=global.cache
    global.cache=global.workdir+global.moddata
    if (!directory_exists(global.cache)) {
        directory_create(global.cache)
        readbimp("sbdat.dll")
    }
    execute_shell(global.cache,"")
    global.cache=mem
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,!!over+2*settings("killjoy"),x,y)

over=0
