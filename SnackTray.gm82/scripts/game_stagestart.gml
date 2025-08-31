///game_stagestart()
//prepares stage objects for gameplay

var m; m=ds_map_create()

draw_clear(0)
screen_refresh()

lemonrunner()

with (pipeblock       ) {if (name!="") ds_map_add(m,name,id) if (nextlevel!="") warp=1}
with (sidepipe        ) {if (name!="") ds_map_add(m,name,id) if (nextlevel!="") warp=1}
with (theothersidepipe) {if (name!="") ds_map_add(m,name,id) if (nextlevel!="") warp=1}

with (heaven          ) if (name!="") ds_map_add(m,name,id)
with (droptarget      )               ds_map_add(m,name,id)

with (pipeblock       ) {if (global.mplay>1) warp=0 t=ds_map_find_value(m,target)}
with (sidepipe        ) {if (global.mplay>1) warp=0 t=ds_map_find_value(m,target)}
with (theothersidepipe) {if (global.mplay>1) warp=0 t=ds_map_find_value(m,target)}

with (itembox) target=ds_map_find_value(m,target)
with (noteblock) target=ds_map_find_value(m,target)
with (heaven)  target=ds_map_find_value(m,target)
with (sprong)  target=ds_map_find_value(m,target)

ds_map_clear(m)

with (door) {if (name!="") ds_map_add(m,name,id) if (nextlevel!="") warp=1}
with (door) {if (warp) {if (global.mplay>1) instance_destroy()} else t=ds_map_find_value(m,target)}

ds_map_clear(m)

//huh
with (warpbox) {if (name!="") ds_map_add(m,name,id) if (nextlevel!="") warp=1}
//Why not give Warpboxes the ability to use droptargets? I'm sure it'll be fine....
with (droptarget) if (name!="") ds_map_add(m,name,id)
with (heaven    ) if (name!="") ds_map_add(m,name,id)
with (warpbox) {if (warp) {if (global.mplay>1) instance_destroy()} else t=ds_map_find_value(m,target)}

ds_map_clear(m)

//Hi.
with (worldmap_tile) if (tile!="" && (string(event)="3" || string(event)="4" || string(event)="5")) ds_map_add(m,tile,id)

with (worldmap_tile) if (data!="" && (string(event)="3" || string(event)="4")) t=ds_map_find_value(m,data)

ds_map_destroy(m)

global.respawn=0

autotilehandler()
liquidtilehandler()

if (!global.lemontest) {
    var l;

    l = global.lskins[global.levelskin+1,0]
    if (l == global.lbase) l = ""

    if (string_count("$locked", global.leveldesc) && !settings(global.currentlevel+l+" found")) {
        settings(global.currentlevel+l+" found",1)
        sound("itemtoken")
        //Possibly add a Found Level notification here? idk
    }

    if (global.gamemode == "timeattack" && global.charname[global.option[0]] != "somari" && global.charname[global.option[0]] != "kid") {
        global.size[0]=1
    }
}
