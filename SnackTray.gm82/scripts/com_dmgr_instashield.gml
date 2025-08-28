x=owner.x+owner.hsp y=owner.y+4+4*!owner.size sprite_index=spr_round32 mask_index=spr_round32 image_yscale=1 image_xscale=1
hittype="instashield"

//if the damager hits a block, then... Do it again!
if com_dmgr_dmg_blocks() if com_dmgr_dmg_blocks()  com_dmgr_dmg_blocks()
com_dmgr_dmg_enemy(true)
com_dmgr_dmg_player()
