//update all player objects in order, in parts.
//this prevents port priority from being such a huge problem.


with (player) {
    mask_reset()
    charm_run("controls")
    charm_run("movement")
    charm_run("actions")
    if (global.gamemode="coop" ||global.gamemode="sscreencoop") { //make absolutely damn sure that coop ignores collisions from pvp
        pvp_ignore=1
        pvp_avoid=1
    }
    with (mydamager) event_user(p2)
    if p2==0 ||  global.gamemode!="sscreencoop"
    player_camera(0)

    spriteswitch(1)

    if use_under_sprite
    under_spriteswitch(1)

    if use_over_sprite
    over_spriteswitch(1)
}
