var type,i;

type=argument[1]

switch (argument[0]) {
    case itembox: {
        if (type=1) {
            return com_editobjitemboxcontent(true,argument[2])
        }
        if (type=2) return string(!funnytruefalse(argument[2]))
        if (type=3) return string(!funnytruefalse(argument[2]))
        if (type=4) return get_string("Bonus Target's name:",argument[2])
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
    } break

    case bigitembox: {
        if (type=1||type=3||type=5) {
            return com_editobjitemboxcontent(true,argument[2])
        }
        if (type=2) return get_string("Center Bonus Target's name:",argument[2])
        if (type=4) return get_string("Left Bonus Target's name:",argument[2])
        if (type=6) return get_string("Right Bonus Target's name:",argument[2])
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
    } break

    case noteblock: {
        if (type=0) {return get_string("Alignment in pixels (x,y):",argument[2])}
        if (type=1) {
            return com_editobjitemboxcontent(true,argument[2])
        }
        if (type=2) return string(!funnytruefalse(argument[2]))
        if (type=3) return string(!funnytruefalse(argument[2]))
        if (type=4) return get_string("Bonus Target's name:",argument[2])
    } break

    case monitor: {
        if (type=1) {
            i=show_contextmenu("Monitor contents:|-|10 Coins|Mushroom|Fire Flower|Mini Mushroom|Star|1-Up|Poison Mushroom|Feather|Shield|Super Ring|Time|Thunder Flower|Water Flower|Ice Flower|Clover Flower|Question Msuhroom",0)
            if (!i) return argument[2]
            if (i=1) return "10coin"
            if (i=2) return "mush"
            if (i=3) return "fire"
            if (i=4) return "mini"
            if (i=5) return "star"
            if (i=6) return "1up"
            if (i=7) return "poison"
            if (i=8) return "feather"
            if (i=9) return "shield"
            if (i=10) return "superring"
            if (i=11) return "time"
            if (i=12) return "thunder"
            if (i=13) return "water"
            if (i=14) return "ice"
            if (i=15) return "clover"
            if (i=16) return "?mush"
        }
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
    } break


    case jetstream: {
        if (type=0) {return get_string("Strength of stream:",argument[2])}
        if (type=1) {
            i=show_contextmenu("Direction of stream:|-|Right|Up|Left|Down",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "90"
            if (i=3) return "180"
            if (i=4) return "270"
        }
        if (type=2) {return get_string("Width of stream:",argument[2])}
        if (type=3) {return get_string("Height of stream:",argument[2])}
        if (type=4) {
            i=show_contextmenu("Stream particles:|-|Bubbles|Wind",0)
            if (!i) return argument[2]
            return string(i)
        }
        if (type=5) return string(!funnytruefalse(argument[2]))
    }

    case segafadewarp: {
        if (type=0) {return get_string("Warp ID:",argument[2])}
        if (type=1) {return get_string("Width of warp:",argument[2])}
        if (type=2) {return get_string("Height of warp:",argument[2])}
    }

    case segafadedest: {
        if (type=0) {return get_string("Warp ID:",argument[2])}
    }

    case downpipe: case sidepipe: case pipeblock: case theothersidepipe: {
        if (type=5) return string(median(0,get_integer("Max Spawns (0-16):#> Lava Bubbles can only have one#> Limit zero makes the spawner unlimited",unreal(argument[2])),16))
        if (type=4) {
            return com_editobjitemboxcontent(true,argument[2])
        }
        if (type=3) return string(!funnytruefalse(argument[2]))
        if (type=2) return get_string("Next level name:",argument[2])
        if (type=1) return get_string("Target's name:",argument[2])
        return get_string("This pipe's name:",argument[2])
    } break
    case retainer: {
        if (type=1) return string(get_integer("Number of hostages: ",unreal(argument[2])))
        return get_string("Next level name:",argument[2])
    } break
    case flagpole: {
        if (type=1) return string(!funnytruefalse(argument[2]))
        return get_string("Next level name:",argument[2])
    } break
    case signpost: {
        if (type=1) return string(!funnytruefalse(argument[2]))
        return get_string("Next level name:",argument[2])
    } break
    case goalblock: {
        if (type=1) return string(!funnytruefalse(argument[2]))
        return get_string("Next level name:",argument[2])
    } break
    case heaven: {
        if (type=1) return get_string("Target's name:",argument[2])
        return get_string("This heaven's name:",argument[2])
    } break
    case door: {
        if (type=6) {
            i=show_contextmenu("Lock Currency:|-|Key|White Token|Blue Token|Green Token",0)
            if (!i) return argument[2]
            if (i=1) return "key"
            if (i=2) return "token"
            if (i=3) return "tokenblue"
            if (i=4) return "tokengreen"
            return "key"
        }
        if (type=5) return string(!funnytruefalse(argument[2]))
        if (type=4) return get_string("Amount of keys required:",argument[2])
        if (type=3) return get_string("Next level name:",argument[2])
        if (type=2) return get_string("Target's name:",argument[2])
        if (type=1) return get_string("This door's name:",argument[2])
        return get_string("Alignment in pixels (x,y):",argument[2])
    } break
    case warpbox: {
        if (type=6) {
            i=show_contextmenu("Lock Currency:|-|Key|White Token|Blue Token|Green Token",0)
            if (!i) return argument[2]
            if (i=1) return "key"
            if (i=2) return "token"
            if (i=3) return "tokenblue"
            if (i=4) return "tokengreen"
            return "key"
        }
        if (type=4 || type=5) return string(!funnytruefalse(argument[2]))
        if (type=3) return get_string("Next level name:",argument[2])
        if (type=2) return get_string("Target's name:",argument[2])
        if (type=1) return get_string("This warp box's name:",argument[2])
        return get_string("Alignment in pixels (x,y):",argument[2])
    } break
    case cardreader:
    case tokencruncher: {
        if (type=1) {
            i=show_contextmenu("Token Type:|-|White|Blue|Green",0)
            if (!i) return argument[2]
            if (i=1) return "token"
            if (i=2) return "tokenblue"
            if (i=3) return "tokengreen"
        }
        if (type=2) return get_string("Name of required Green Token:",argument[2])
        var tokene;
        if argument[0] == tokencruncher tokene="Tokens" else tokene="Cards"
        return get_string("Amount of "+tokene+":",argument[2])
    } break
    case anchor: {
        if (type=1) return get_string("Offset:",argument[2])
        if (type=2) return string(show_contextmenu("Use current region|Ground|Underground|Underwater|Castle|Bonus|Sky|Beach|Forest|Desert|GhostHouse|Airship|Volcano|Snow|Autumn|Factory|Clockwork|Abstract|Tutorial",0))
        return get_string("Asset name:",argument[2])
    } break
    case axe: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Output Channel ID (0-999):",argument[2])
        }
    } break
    case axewall: {
        return string(show_contextmenu("Normal|Slow|Faster",unreal(argument[2])))
    } break
    case talkbox: {
        return get_string("Text:",argument[2])
    } break
    case mark: {
        return get_string("Object:",argument[2])
    } break
    case textblock: {
        if (type=0) return get_string("Text:",argument[2])
        if (type=1) return string(show_contextmenu("Left|Center|Right",unreal(argument[2])))
        if (type=2) return string(get_color(unreal(argument[2])))
    }
    case function: {
        if (type=0) {
            i=show_contextmenu("Function:|-|Save|Character Swap|Level End",0)
            if (!i) return argument[2]
            if (i=1) return "save"
            if (i=2) return "char"
            if (i=3) return "end"
        }
        if (type=1) return get_string("Function block text:",argument[2])
    }
    case turing: {
        with (drawregion) {
            turingpick=1
            turinginst=other.id
            turingtype=type
            grabx=-1
        }
        return argument[2]
    }
    case sprong: {return get_string("Bonus Target's name:",argument[2])}
    case droptarget: {return get_string("This drop's name:",argument[2])} break
    case platform: {
        if (type=0) {return get_string("Alignment in pixels (x,y):",argument[2])}
        if (type=1) {
            i=show_contextmenu("Platform type:|-|Flimsy|Bowser|Horizontal Wave|Vertical Wave|Wrap Up|Wrap Down|Pulley A|Pulley B|Cloud",0)
            if (!i) return argument[2]
            if (i=1) return "platfall"
            if (i=2) return "plat3"
            if (i=3) return "platsineh"
            if (i=4) return "platsinev"
            if (i=5) return "platwrap_up"
            if (i=6) return "platwrap_down"
            if (i=7) return "pulley"
            if (i=8) return "pulley_sub"
            if (i=9) return "cloudform"
        }
        if (type=2)
        {
        return string(!funnytruefalse(argument[2]))
        }
        if (type=3) return string(max(2,get_integer("Pulley height, in tiles:",unreal(argument[2]))))
    } break
    case redring: {
        if (type=0) {return get_string("Alignment in pixels (x,y):",argument[2])}
        if (type=1) {
            i=show_contextmenu("Red Ring ID:|-|1|2|3|4|5",0)
            if (!i) return "1"
            return string(i)

        }
    } break
    case platdonut: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) return string(!funnytruefalse(argument[2]))
    }
    case fbarblock: {
        if (type=0) {return get_string("Alignment in pixels (x,y):",argument[2])}
        if (type=1) {
            i=show_contextmenu("Firebar type:|-|Normal|Off|Waffle",0)
            if (!i) return argument[2]
            if (i=1) return "normal"
            if (i=2) return "off"
            if (i=3) return "cookie"
        }
        if (type=2) return string(!funnytruefalse(argument[2]))
        if (type=3) return string(!funnytruefalse(argument[2]))
        if (type=4) return string(median(0,get_integer("Length, in fireballs:",unreal(argument[2])),32))
        if (type=5) return get_string("Angle Overwrite, in degrees:",argument[2])
    } break
    case spike: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Spike type:|-|Always On|Trap|Timer|Timer Alt|On-Off|Off-On",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=2) {
            i=show_contextmenu("Orientation:|-|Point Right|Point Up|Point Left|Point Down|Auto Point|Star Shape",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    } break
    case waterblock: {
        if (type=0) return string(median(get_integer("Width: ",unreal(argument[2],1)),1,32))
        if (type=1) return string(median(get_integer("Height: ",unreal(argument[2],1)),1,32))
        break;
    }
    case fakesemiplat: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) return string(median(get_integer("Width: ",unreal(argument[2],1)),1,32))
        if (type=2) return string(median(get_integer("Height: ",unreal(argument[2],1)),1,32))
        if (type=3) {
            i=show_contextmenu("Variation:|-|Red|Yellow|Blue",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }
    case lakitu: {return string(get_integer("Lakitu's area of effect, in tiles:",unreal(argument[2]) div 16)*16)}
    case bowserboss: {
        return string(!funnytruefalse(argument[2]))
    }

    case token: {
        if (type=1) {
            i=show_contextmenu("Token Type:|-|White|Blue|Green",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=2) {
            return get_string("Green Token name:",argument[2])
        }
        return get_string("Alignment in pixels (x,y):",argument[2])
    }
    case goomba:
    case goombrat:
    case beetle:
    case hopkoopa:
    case koopa:
    case redhover:
    case drybones:
    case redkoopa:
    case spiny:
    case piranha:
    case redpiranha:
    case coin:
    case crabmeat:
    case newtron:
    case rexbig:
    case starshard:
    case mushroom:
    case mushmini:
    case keyitem:
    case carditem:
    case flower:
    case shield:
    case starman:
    case mushpoison:
    case vine:
    case redcoin:
    case fishbones:
    case spikenemy:
    case wigglerhead:
    case orbinautgreen:
    case orbinautblue:
    case orbinautred:
    case orbinautbumper:
    case chopper:
    case muncher:
    case bigmuncher:
    case podoboo: {
        if (type=1) return string(!funnytruefalse(argument[2]))
        return get_string("Alignment in pixels (x,y):",argument[2])
    }
    case hammerbro: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Type:|-|No Rage|Normal Rage|Enraged",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }
    case montymole: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) return string(!funnytruefalse(argument[2]))
    }
    case thwomp: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Type:|-|Down|Left|Right",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }
    case thwimp: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Starting Direction:|-|Right|Left",0)
            if (!i) return argument[2]
            if (i=1) return "1"
            if (i=2) return "-1"
        }
    }
    case shell: {
        i=show_contextmenu("Shell type:|-|Green|Red|Beetle|Spiny",0)
        if (!i) return argument[2]
        return string(i-1)
    }
    case singlecheep: {
        return string(show_contextmenu("Red Cheep|Green Cheep|Flying Cheep",unreal(argument[2])))
    }
    case checkpoint: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Functionality:|-|Normal|No Bonus|Classic",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=2) {
            i=show_contextmenu("Powerup Held:|-|Fire Flower|Feather",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case tyler: {
        if (type=0) return get_string("Offset: ",argument[2])
        if (type=1) return tylerpicker(argument[2],0)
        if (type=2) {
            i=show_contextmenu("Layer:|-|Behind|Middle|OverTerrain|Front",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=3) {
            i=show_contextmenu("Collision type:|-|Off|Solid|Semisolid|Intangible Spike|Solid Spike",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=4) return get_string("Repeat: ",argument[2])
        if (type=5) {
            i=show_contextmenu("Mirroring:|-|Off|Flipped|Upside|Rotated",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=6) return string(get_color(deciphercolor(argument[2])))
        if (type=7) return string(show_contextmenu("Use current region|Ground|Underground|Underwater|Castle|Bonus|Sky|Beach|Forest|Desert|GhostHouse|Airship|Volcano|Snow|Autumn|Factory|Clockwork|Abstract|Tutorial",0)-1)
        if (type=8) return get_string("Frames: ",argument[2])
    }
    case terraintyler: {
        if (type=0) return get_string("Offset: ",argument[2])
        if (type=1) return tylerpicker(argument[2],1)
        if (type=2) {
            i=show_contextmenu("Layer:|-|Behind|Middle|Front",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=3) {
            i=show_contextmenu("Collision type:|-|Off|Solid|Semisolid|Intangible Spike|Solid Spike",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=4) return get_string("Repeat: ",argument[2])
        if (type=5) {
            i=show_contextmenu("Mirroring:|-|Off|Flipped|Upside|Rotated",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=6) return string(get_color(deciphercolor(argument[2])))
        if (type=7) return string(show_contextmenu("Use current region|Ground|Underground|Underwater|Castle|Bonus|Sky|Beach|Forest|Desert|GhostHouse|Airship|Volcano|Snow|Autumn|Factory|Clockwork|Abstract|Tutorial",0)-1)
        if (type=8) return get_string("Frames: ",argument[2])
    }
    case objectstyler: {
        if (type=0) return get_string("Offset: ",argument[2])
        if (type=1) return tylerpicker(argument[2],2)
        if (type=2) {
            i=show_contextmenu("Layer:|-|Behind|Middle|Front",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=3) {
            i=show_contextmenu("Collision type:|-|Off|Solid|Semisolid|Intangible Spike|Solid Spike",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=4) return get_string("Repeat: ",argument[2])
        if (type=5) {
            i=show_contextmenu("Mirroring:|-|Off|Flipped|Upside|Rotated",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=6) return string(get_color(deciphercolor(argument[2])))
        if (type=7) return string(show_contextmenu("Use current region|Ground|Underground|Underwater|Castle|Bonus|Sky|Beach|Forest|Desert|GhostHouse|Airship|Volcano|Snow|Autumn|Factory|Clockwork|Abstract|Tutorial",0)-1)
        if (type=8) return get_string("Frames: ",argument[2])
    }
    case decortyler: {
        if (type=0) return get_string("Offset: ",argument[2])
        if (type=1) return tylerpicker(argument[2],3)
        if (type=2) {
            i=show_contextmenu("Layer:|-|Behind|Middle|Front",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=3) {
            i=show_contextmenu("Collision type:|-|Off|Solid|Semisolid|Intangible Spike|Solid Spike",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=4) return get_string("Repeat: ",argument[2])
        if (type=5) {
            i=show_contextmenu("Mirroring:|-|Off|Flipped|Upside|Rotated",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=6) return string(get_color(deciphercolor(argument[2])))
        if (type=7) return string(show_contextmenu("Use current region|Ground|Underground|Underwater|Castle|Bonus|Sky|Beach|Forest|Desert|GhostHouse|Airship|Volcano|Snow|Autumn|Factory|Clockwork|Abstract|Tutorial",0)-1)
        if (type=8) return get_string("Frames: ",argument[2])
    }

    case phaser: {
        if (type=1) {
            i=show_contextmenu("Direction:|-|Up|Left|Right|Down",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "-1"
            if (i=3) return "1"
            if (i=4) return "2"
        }
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
    }
    case brick: {
     if (type=1) {
            i=show_contextmenu("Stone:|-|No stone|Has stone|Is stone",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "1"
            if (i=3) return "2"
        }
        if (type=2) {
            i=show_contextmenu("Quality:|-|Undamaged|Cracked",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "1"
        }
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
    }
    case bigbrick: {
        if (type=1) {
            i=show_contextmenu("Quality:|-|Undamaged|Cracked",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "1"
        }
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
    }
    case itemlaunch: {
        if (type=1) {
            return com_editobjitemboxcontent(false,argument[2])
        }
        if type=0 return get_string("Alignment in pixels (x,y):",argument[2])
    }
    case beepblockon:
    case beepblockoff: {
        if (type=1) return get_string("How many beats should happen before blinking:",argument[2])
        if type=0 return get_string("Alignment in pixels (x,y):",argument[2])
    }

    case activate_region: {
        if (type=1) return string(get_integer("Width of region:",argument[2]))
        if (type=2) return string(get_integer("Height of region:",argument[2]))
        if type=0 return get_string("Alignment in pixels (x,y):",argument[2])
    }

    case crystaltap: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Trigger:|-|No|Horizontal|Vertical",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "1"
            if (i=3) return "2"
        }
    }

    case code: {
        if (type=0) {
            return get_string("Code:",argument[2])
        }
        if (type=1) {
            i=show_contextmenu("Run mode:|-|Trigger|Loop|Start|Always|Draw",0)
            if (!i) return argument[2]
            if (i=1) return "trig"
            if (i=2) return "loop"
            if (i=3) return "auto"
            if (i=4) return "always"
            if (i=5) return "draw"
        }
        if (type=2) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
    }

    case ballcannon: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Orientation:|-|Point Up|Point Down|Point Left|Point Right|Point Up-Left|Point Up-Right|Point Down-Left|Point Down-Right",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=2) {
            i=show_contextmenu("Stand Orientation:|-|Stand Down|Stand Up|Stand Left|Stand Right|",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case redballcannon: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Orientation:|-|Point Up|Point Down|Point Left|Point Right|Point Up-Left|Point Up-Right|Point Down-Left|Point Down-Right",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=2) {
            i=show_contextmenu("Stand Orientation:|-|Stand Down|Stand Up|Stand Left|Stand Right|",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case ballcannonquad: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Direction:|-|Normal|Diagonal|",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case redballcannonquad: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Direction:|-|Normal|Diagonal|",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case conveyorbelt: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) return string(median(get_integer("speed: ",unreal(argument[2],1)),-10,10))
        if (type=2) {
            i=show_contextmenu("Edge Tiles:|-|On|Off",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case terrainspring: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Orientation:|-|Point Up|Point Down|Point Left|Point Right|Point Up-Left|Point Up-Right|Point Down-Left|Point Down-Right",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case terrainsprong: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Orientation:|-|Point Up|Point Down|Point Left|Point Right|Point Up-Left|Point Up-Right|Point Down-Left|Point Down-Right",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case bumper:
    {
    if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
    if (type=1) {
            i=show_contextmenu("Size:|-|Big|Small|",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    break
    }

    case sonicspike: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Orientation:|-|Point Right|Point Up|Point Left|Point Down|Auto",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case signalcommunicator: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Input Channel ID 1 (0-999): ",argument[2])
        }
        if (type=2) {
            return get_string("Input Channel ID 2 (0-999): ",argument[2])
        }
        if (type=3) {
            return get_string("Output Channel ID 1 (0-999): ",argument[2])
        }
        if (type=4) {
            return get_string("Output Channel ID 2 (0-999): ",argument[2])
        }
        if (type=5) {
            return get_string("Output Channel ID 3 (0-999): ",argument[2])
        }
        if (type=6) {
            return get_string("Output Channel ID 4 (0-999): ",argument[2])
        }
        if (type=7) {
            i=show_contextmenu("Logic:|-|OR|AND|NOR|NAND|XOR|XNOR",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case variableblock: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Add Input ID (0-999): ",argument[2])
        }
        if (type=2) {
            return get_string("Subtract Input ID (0-999): ",argument[2])
        }
        if (type=3) {
            return get_string("Minimum Value (0-99): ",argument[2])
        }
        if (type=4) {
            return get_string("Maximum Value (0-99): ",argument[2])
        }
        if (type=5) {
            return get_string("Reset Channel ID (0-999): ",argument[2])
        }
        if (type=6) {
            i=show_contextmenu("Behavior:|-|Wrap|Clamp|Randomize",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case channelmaster: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Input Channel ID Left (0-999): ",argument[2])
        }
        if (type=2) {
            return get_string("Input Channel ID Right (0-999): ",argument[2])
        }
        if (type=3) {
            return get_string("Input Channel ID Activate (0-999): ",argument[2])
        }
    }

    case bopblock: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Output Channel ID 1 (0-999): ",argument[2])
        }
        if (type=2) {
            return get_string("Output Channel ID 2 (0-999): ",argument[2])
        }
        if (type=3) {
            return get_string("Output Channel ID 3 (0-999): ",argument[2])
        }
    }

    case button: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Output Channel ID (0-999):",argument[2])
        }
        if (type=2) {
            i=show_contextmenu("Filter:|-|Players and Objects|Players|Objects|Enemies|All",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=3) {
            return string(!funnytruefalse(argument[2]))
        }
        if (type=4) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case onoffscreen: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Input Channel ID 1 (0-999):",argument[2])
        }
        if (type=2) {
            return get_string("Input Channel ID 2 (0-999):",argument[2])
        }
        if (type=3) {
            return get_string("Input Channel ID 3 (0-999):",argument[2])
        }
        if (type=4) {
            return get_string("Input Channel ID 4 (0-999):",argument[2])
        }
        if (type=5) {
            i=show_contextmenu("Type:|-|Timer|Counter|Lantern",0)
            if (!i) return argument[2]
            return string(i-1)
        }
     }

     case displayscreen: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Input Channel ID TL (0-999):",argument[2])
        }
        if (type=2) {
            return get_string("Input Channel ID TR (0-999):",argument[2])
        }
        if (type=3) {
            return get_string("Input Channel ID BL (0-999):",argument[2])
        }
        if (type=4) {
            return get_string("Input Channel ID BR (0-999):",argument[2])
        }
     }

     case gate: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
        if (type=2) {
        return get_string("Height:",argument[2])
        }
        if (type=3) {
        return get_string("Speed:",argument[2])
        }
        if (type=4) {
            return string(!funnytruefalse(argument[2]))
        }
        if (type=5) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case sidegate: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
        if (type=2) {
        return get_string("Width:",argument[2])
        }
        if (type=3) {
        return get_string("Speed:",argument[2])
        }
        if (type=4) {
            return string(!funnytruefalse(argument[2]))
        }
        if (type=5) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case timerblock: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
        if (type=2) {
            return get_string("Output Channel ID 1 (0-999):",argument[2])
        }
        if (type=3) {
            return get_string("Output Channel ID 2 (0-999):",argument[2])
        }
        if (type=4) {
            return get_string("Time in frames (60=1s):",argument[2])
        }
    }

    case ireader: {
        if (type=0) {
            with (drawregion) {
                ireaderpick=1
                ireaderinst=other.id
                grabx=-1
            }
            return argument[2]
        }
        if (type=1) {
            return get_string("State Value:",argument[2])
        }
        if (type=2) {
            return get_string("Output Channel ID (0-999):",argument[2])
        }
        if (type=3) {
            return get_string("Output Channel ID 2 (0-999):",argument[2])
        }
        if (type=4) {
            return get_string("Output Channel ID 3 (0-999):",argument[2])
        }
        if (type=5) {
            return get_string("Output Channel ID 4 (0-999):",argument[2])
        }
    }

    case gobble: {
        if (type=0) {
            with (drawregion) {
                gobblepick=1
                gobbleinst=other.id
                grabx=-1
            }
            return argument[2]
        }
        if (type=1) {
            with (drawregion) {
                gobblepick2=1
                gobbleinst2=other.id
                grabx=-1
            }
            return argument[2]
        }
        if (type=2) {
            i=show_contextmenu("Calculation:|-|Equal To|Greater Than|Less Than",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=3) {
            return get_string("Output Channel ID (0-999):",argument[2])
        }
    }

    case spawnerblock: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Object:|-|Static Dummy|Object Dummy|Enemy Dummy|Collider Dummy|Hazard Dummy|Cork|Stone",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=2) {
            return get_string("Create Code:",argument[2])
        }
        if (type=3) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
        if (type=4) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case enemydummy: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Create Code:",argument[2])
        }
    }

    case spriteswitcher: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return string(!funnytruefalse(argument[2]))
        }
        if (type=2) {
            return get_string("Set Sprite:",argument[2])
        }
        if (type=3) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
    }

    case bombenemy: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Mode:|-|Walk|Sit",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

    case detector: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            return get_string("Output Channel ID (0-999):",argument[2])
        }
        if (type=2) {
            i=show_contextmenu("Filter:|-|Players and Objects|Players|Objects|Enemies|All",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=3) {
        return get_string("Height:",argument[2])
        }
        if (type=4) {
            return string(!funnytruefalse(argument[2]))
        }
        if (type=5) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case signalblock: {
        if (type=0) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
        if (type=1) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case lightbulb: {
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
        if (type=1) {
            i=show_contextmenu("Light Shape:|-|Ellipse|Square|Spotlight",0)
            if (!i) return "ellipse"
            if (i=1) return "ellipse"
            if (i=2) return "square"
            if (i=3) return "spotlight"
        }
        if (type=2) return get_string("Light Width:",argument[2])
        if (type=3) return get_string("Light Height:",argument[2])
        if (type=4) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
    }

    case swinginghammer: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Starting Angle:|-|Right|Up|Left|Down",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "90"
            if (i=3) return "180"
            if (i=4) return "270"
        }
        if (type=2) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case urchin: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Behavior:|-|Horizontal Move|Vertical Move|Horizontal Wave|Vertical Wave",0)
            if (!i) return argument[2]
            if (i=1) return "0"
            if (i=2) return "1"
            if (i=3) return "2"
            if (i=4) return "3"
        }
        if (type=2) {
            return string(!funnytruefalse(argument[2]))
        }
    }

    case crate: {
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
        if (type=1) {
            return com_editobjitemboxcontent(true,argument[2])
        }
    }

    case iceblock: {
        if (type=0){return get_string("Alignment in pixels (x,y):",argument[2])}
        if (type=1) {
            return com_editobjitemboxcontent(true,argument[2])
        }
    }

    case fireballshooter: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Direction:|-|Right|Left|Up|Down",0)
            if (!i) return argument[2]
            return string(i-1)
        }
        if (type=2) {
            return get_string("Input Channel ID (0-999):",argument[2])
        }
    } break

    case spikecrusher: {
        if (type=0) return get_string("Width:",argument[2])
        if (type=1) return get_string("Length of chain (0=Infinite):",argument[2])
        if (type=2) {
            return string(!funnytruefalse(argument[2]))
        }
    } break

    case pokey: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) return get_string("Body Height:",argument[2])
    } break

    case chardoor: {
        if (type=0) return get_string("Filename of character (lowercase):",argument[2])
    } break

    case burner: {
        if (type=0) return get_string("Alignment in pixels (x,y):",argument[2])
        if (type=1) {
            i=show_contextmenu("Orientation:|-|Point Up|Point Down|Point Left|Point Right",0)
            if (!i) return argument[2]
            return string(i-1)
        }
    }

}

if (type=1) return string(!funnytruefalse(argument[2]))
return get_string("Alignment in pixels (x,y):",argument[2])
