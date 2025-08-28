///tile_bake(background,left,top,width,height,x,y,depth)
var t,ye;

myFavouriteTile=tile_add(argument[0],argument[1],argument[2],argument[3],argument[4],argument[5],argument[6],argument[7])

/*
ye=0
with (batchan) if (depth==argument[7] && sheet==argument[0]) ye=1
if (!ye) with (instance_create(0,0,batchan)) {depth=argument[7] sheet=argument[0]}
*/
