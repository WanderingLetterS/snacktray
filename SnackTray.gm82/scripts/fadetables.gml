var from,to;

from=argument[1]
to=argument[2]

if (argument[0]="music") {
    return (
        (from=roster && !global.bundled) || from=ta_roster ||from=replays || from=options || from=trophies || from=ta_results || (from=ta_menu && to!=change) || from=modloader ||
        (from=stagesel && to=roster) ||
        (from=mainmenu && to=roster) ||
        (from=mainmenu && to=ta_roster) ||
        to=finalscore || to=options || to=trophies || to=replays || to=ta_results || to=modloader || to=ta_menu
    )
}

if (argument[0]="border") {
    return (
        (from=roster && !global.bundled) || from=ta_roster || from=replays || from=ta_results || (from=ta_menu && to!=change) || from=modloader ||
        (from=stagesel && to=roster) ||
        (from=options && to=mainmenu) ||
        (from=trophies && to=mainmenu) ||
        (from=mainmenu && to=roster) ||
        (from=mainmenu && to=ta_roster) ||
        (from=mainmenu && to=replays) ||
        to=finalscore || to=options || to=trophies || to=ta_results || to=modloader || to=ta_menu
    )
}

if (argument[0]="msbg") {
    return (
        (from=roster && !global.bundled) || to=roster || to=ta_menu ||
        (from=mainmenu && (to=replays || to=options || to=trophies || to=ta_results || to=modloader || to=ta_roster)) ||
        ((from=replays || from=options || from=trophies || from=ta_results || from=modloader || from=ta_roster) && to=mainmenu) || (from=ta_menu && to!=change)
    )
}
