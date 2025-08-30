var p,str,find,maxx,d,test;
//This is used for when a deity needs to do a final something, mainly for us, update any ground below itself.

image_xscale=1
image_yscale=1

switch (obj) {

    case groundsemi: {
        frame=0
        aboveground=instance_position(x,y+1,object_index) //TEchnically below ground whoopsssss
        if aboveground if (aboveground.obj=slopel1s||aboveground.obj=sloper1s||aboveground.obj=slopel2s||aboveground.obj=sloper2s||aboveground.obj=groundsemi) aboveground.frame=0
    }break;
    case groundblock: {
        frame=0
     aboveground=instance_position(x,y+1,object_index) //TEchnically below groundblock whoopsssss
        if aboveground if (aboveground.obj=slopel1||aboveground.obj=sloper1||aboveground.obj=slopel2||aboveground.obj=sloper2||aboveground.obj=groundblock) aboveground.frame=0
    }break;
}
