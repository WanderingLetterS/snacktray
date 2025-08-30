if (instance_exists(moranboll)) exit

with (invisibox) x=xstart
with (pulley) {john_x=x x=xstart}
with (pulley_sub) {john_x=x x=xstart}

instance_deactivate_object(collider)
instance_deactivate_object(brick)
instance_deactivate_object(ground)
instance_deactivate_object(kidground)
instance_deactivate_object(coin)
instance_deactivate_object(enemy)
instance_deactivate_object(hittable)
instance_deactivate_object(lavablock)
instance_deactivate_object(muncher)
instance_deactivate_object(bigmuncher)
instance_deactivate_object(sonicspike)
instance_deactivate_object(stone)
instance_deactivate_object(cork)
instance_deactivate_object(anchor)
instance_deactivate_object(assethelper)
instance_deactivate_object(assethelperanim)
instance_deactivate_object(drawingdummy)
instance_deactivate_object(tyler)
instance_deactivate_object(terraintyler)
instance_deactivate_object(objectstyler)
instance_deactivate_object(decortyler)
instance_deactivate_object(objectdummy)
instance_deactivate_object(staticdummy)
instance_deactivate_object(enemydummy)
instance_deactivate_object(swinginghammer)
instance_deactivate_object(grinder)
instance_deactivate_object(lightbulb)
instance_deactivate_object(spikecrusher)
instance_deactivate_object(delfruit)

instance_deactivate_object(activate_region)

//New???
instance_deactivate_object(spike)
instance_deactivate_object(terrainspring)
instance_deactivate_object(sidepipe)
instance_deactivate_object(theothersidepipe)
instance_deactivate_object(slopy)
instance_deactivate_object(redring)
instance_deactivate_object(waterblock)
instance_deactivate_object(waterfall)
instance_deactivate_object(lavafall)
instance_deactivate_object(itemlaunch)
instance_deactivate_object(castledoor)
instance_deactivate_object(streambubble)
instance_deactivate_object(streamwind)
instance_deactivate_object(jetstream)
instance_deactivate_object(pipeitemspawner)
instance_deactivate_object(textblock)
instance_deactivate_object(flaggy)
instance_deactivate_object(podoboo)
instance_deactivate_object(door)
instance_deactivate_object(itemring)
instance_deactivate_object(cardreader)
instance_deactivate_object(chardoor)
instance_deactivate_object(axe)
instance_deactivate_object(bumper)
instance_deactivate_object(vine)
instance_deactivate_object(beepblockoff)
instance_deactivate_object(pollenflower)
instance_deactivate_object(item)
instance_deactivate_object(warpbox)
instance_deactivate_object(fireballshooter)
instance_deactivate_object(thwomp)
instance_deactivate_object(thwimp)
instance_deactivate_object(ballcannon)
instance_deactivate_object(redballcannon)
instance_deactivate_object(ballcannonquad)
instance_deactivate_object(redballcannonquad)
instance_deactivate_object(cannon)
instance_deactivate_object(redcannon)
instance_deactivate_object(singlecheep)
instance_deactivate_object(bowserboss)
instance_deactivate_object(jumprefresh)
instance_deactivate_object(dashpanel)
instance_deactivate_object(segafadewarp)
instance_deactivate_object(segafadedest)
instance_deactivate_object(firebar)
instance_deactivate_object(retainee)
instance_deactivate_object(grateblock)
instance_deactivate_object(minusbowser)
instance_deactivate_object(montyhole)
instance_deactivate_object(litbobomb)

instance_activate_object(player)
instance_activate_object(lakitu)
instance_activate_object(axewall)
instance_activate_object(redcoin)
instance_activate_object(cheepfly)
instance_activate_object(moving)

/*instance_activate_object(orbinautgreen)
instance_activate_object(orbinautblue)
instance_activate_object(orbinautred)
instance_activate_object(orbinautbumper)    */

instance_activate_object(timerblock)
instance_activate_object(onoffscreen)
instance_activate_object(signalcommunicator)
instance_activate_object(ireader)
instance_activate_object(detector)
instance_activate_object(variableblock)
instance_activate_object(gobble)

if object_index=editmanager
instance_activate_region(view_xview[0],view_yview[0],view_wview[0],view_hview[0],1)
else for (i=0;i<=global.mplay;i+=1) {
    //instance_activate_region(players[i].x-440,-verybignumber,880,verybignumber*2,1)
        instance_activate_region(view_xview[i]-80,view_yview[i]-80,view_wview[0]+160,view_hview[0]+160,1)

    if (players[i].carry) {
        instance_activate_object(players[i].carryid)
        with (players[i].carryid) instance_activate_object(carry)
    }
}


with player if is_cpu instance_activate_region(x-860,y-60,120,120,1)
with moving {
    if sub instance_activate_object(sub)
    if main instance_activate_object(main)
}
with activate_region {
    if imwrapper>1 {getregion(x) imwrapper=(y == 16 && image_yscale*16 == region.ky-16)}
    instance_activate_region(x,y -(32 * imwrapper),(image_xscale*16),(image_yscale*16)+(64 * imwrapper),1) //enlarged so that you can properly activate vertically wrapping platforms without aligning the region out of level bounds
}

with (invisibox) if (untouched) x=-1000
with (pulley) x=john_x
with (pulley_sub) x=john_x
