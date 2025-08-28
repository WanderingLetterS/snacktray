///replaceasset(folder,baseasset)
//replaces stage assetration from files, updating properties from filename data
if settings("removeassets") exit

var i,j,f,spr,p,pr,z,p2,first,l,ls,k,s;

global.asset[0,0]=0
i=0

pr=ds_priority_create()
ls=ds_list_create()

if (argument_count=2)
for (f=file_find_first(argument[1]+"baseassets\*.png",0);f!="";f=file_find_next()) ds_list_add(ls,argument[1]+"baseassets\"+f) file_find_close()
for (f=file_find_first(argument[0]+"assets\*.png",0);f!="";f=file_find_next()) ds_list_add(ls,argument[0]+"assets\"+f) file_find_close()

l=ds_list_size(ls)
for (k=0;k<l;k+=1) {
    f=ds_list_find_value(ls,k)
    spr=f

    //if (!spr) {ping(lang("error skin corrupt")+"#"+f) continue}
    i+=1
    global.asset[0,0]=i

    global.asset[i,0]=spr    //texture
    global.asset[i,1]=0      //unused (was room)
    global.asset[i,2]=0      //x
    global.asset[i,3]=0      //y
    global.asset[i,4]=1      //animation
    global.asset[i,5]=0      //foreground
    global.asset[i,6]=f      //filename
    global.asset[i,7]=1      //speed
    global.asset[i,8]=""     //anchor
    global.asset[i,9]=69      //biome
    global.asset[i,10]=0     //blend mode
    global.asset[i,11]=1     //width
    global.asset[i,12]=1     //height
    z=0

    first=1 biome=69 type=""

    str=filename_change_ext(filename_fixname(f),"-")
    do {
        p=string_pos("-",str)
        s=string_copy(str,1,p-1)
        str=string_delete(str,1,p)

        if (first) {
            p2=string_pos("@",s)
            if (p2) type=string_copy(s,2,p2-2)
            else type=s
            first=0
        } else {
            c=string_char_at(s,1)
            if (c="x") global.asset[i,2]=unreal(string_replace(s,"m","-"))
            if (c="y") global.asset[i,3]=unreal(string_replace(s,"m","-"))
            if (c="a") global.asset[i,4]=max(1,unreal(s))
            if (c="s") global.asset[i,7]=unreal(s,1)
            if (c="z") z=unreal(s,1)

            if (s="f") global.asset[i,5]=1
            if (s="bm_add") global.asset[i,10]=1
            if (s="bm_sub") global.asset[i,10]=2

            for (j=0;j<global.biomes;j+=1) {
                if (string_pos("@"+global.biome[j],s)) biome=j
            }
        }
    } until str=""
    global.asset[i,8]=type
    global.asset[i,9]=biome

    //These are only added when they are necessary

    //global.asset[i,11]=sprite_get_width(spr)
    //global.asset[i,12]=sprite_get_height(spr)




    ds_priority_add(pr,i,z)

    //if (frac(sprite_get_height(spr)/global.asset[i,4])!=0) error("asset texture "+f+" is not sized correctly for the indicated number of animation frames.")
}

i=1
repeat (ds_priority_size(pr)) {
    global.assetz[i]=ds_priority_delete_max(pr)
    i+=1
}

ds_priority_destroy(pr)
ds_list_destroy(ls)
