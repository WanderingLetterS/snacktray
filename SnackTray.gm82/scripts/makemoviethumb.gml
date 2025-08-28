if (sprite_exists(global.replaythumb)) sprite_delete(global.replaythumb)

var vx,vy;

vx=min(168,max(8,players[0].x-view_xview[0]-112))
vy=min(56,max(32,players[0].y-view_yview[0]-104))

hudlayer.visible=0 //2.1's hud is in the way of the replay thumbnail
global.replaythumb=sprite_create_from_surface(globalmanager.appsurf,vx,vy,224,160,0,0,0,0)
hudlayer.visible=1
