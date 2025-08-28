#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !(settings("nolemonsound")) sound("lemoncontext")
opt=show_contextmenu("Ground|Underground|Underwater|Castle|Bonus|Sky|Beach|Forest|Desert|GhostHouse|Airship|Volcano|Snow|Autumn|Factory|Clockwork|Abstract|Tutorial",-1)
if !(settings("nolemonsound")) sound("lemonselectitem")

if (opt!=-1) {
    if (t=0) lemongrab.typeobj[drawregion.region]=getbiomename(opt)
    if (t=1) lemongrab.typebg[drawregion.region]=getbiomename(opt)
    if (t=2) lemongrab.typemus[drawregion.region]=getbiomename(opt)
    with (drawregion) event_user(7)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (t=0) draw_sprite(spr_biomes,getbiomeid(lemongrab.typeobj[drawregion.region]),x,y)
if (t=1) draw_sprite(spr_biomes,getbiomeid(lemongrab.typebg[drawregion.region]),x,y)
if (t=2) draw_sprite(spr_biomes,getbiomeid(lemongrab.typemus[drawregion.region]),x,y)

if (over) {
    if (t=0) drawtooltip((bbox_left+bbox_right)/2,97,"Object palette",1)
    if (t=1) drawtooltip((bbox_left+bbox_right)/2,97,"Background type",1)
    if (t=2) drawtooltip((bbox_left+bbox_right)/2,97,"Music track",1)
}
