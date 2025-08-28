#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=cosine(xstart,xstart+27,replaybox.f)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (replayctrl) {
    if (selgo) {
        if (!readmoviefile(filename)) ping("Corrupt replay: can't watch.")
        else if (unpackmovie()) {
            global.playback=1
            global.thismovie=cur
            dead=1
            discord_update_presence("","Loading a level ("+global.nextlevel+")","boll-icon","dice-icon")
            game_start()
            segafadeto(change,"systemstart")
            with segafade {forcefade=1}
        }
    } else if (cur!=-1) {
        selgo=1
        sound("systemselect")
        replaybomber.bomb=0
        filename=ds_map_find_value(ds_list_find_value(maps,cur+page),"fn")
        if (replaybox.spr!=-1) sprite_delete(replaybox.spr)
        tmp=global.tempdir+"replay.png"
        file_copy(filename,tmp)
        replaybox.spr=sprite_add(tmp,1,0,0,0,0)
        file_delete(tmp)
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (replayctrl.cur=-1) over=0

draw_sprite_ext(sprite_index,!!over,x,y,1,1,0,$ffffff,1-(replayctrl.cur=-1)*0.5)

over=0
