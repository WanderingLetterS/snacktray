///savemetadata()
//creates a metadata block for information update between stages

if (global.record) {
    m=ds_map_create()

    for (i=0;i<global.mplay;i+=1) {
        ds_map_add(m,"s"+string(i),global.shielded[i])
        ds_map_add(m,"p"+string(i),global.points[i])
        ds_map_add(m,"i"+string(i),global.size[i])
        ds_map_add(m,"e"+string(i),global.energy[i])
        META_TYPE=0
        entrypoint="meta"
        string_execute(global.charcode[global.option[i]])
    }
    ds_map_add(m,"rn",global.rand)
    ds_map_add(m,"vd",global.lifes)
    ds_map_add(m,"go",global.nextlevel)
    ds_map_add(m,"ck",global.check)
    ds_map_add(m,"tk",global.tokens)
    ds_map_add(m,"sc",max(1,global.visualstagecount))
    ds_map_add(m,"sb","|blok|"+ds_map_write(global.spentblocks)+"|/blok|")
    ds_map_add(m,"st","|tokn|"+ds_map_write(global.tokenspend)+"|/tokn|")

    writebyte($ff,global.keylog)
    writebyte($ff,global.keylog)
    writestring("|meta|"+ds_map_write(m)+"|/meta|",global.keylog)
    ds_map_destroy(m)
}
