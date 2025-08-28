if (instance_exists(gamemanager)) return replacekeyword(
    lang("tip world"),
    "jump",string_upper(keyname(global.key[4,0])),
    "action",string_upper(keyname(global.key[5,0]))
)

switch (room) {
    case titlescreen: return gametitle+" v("+version+")"
    case mainmenu: return lang("tip main menu")
    case options: return lang("tip options")
    case replays: return lang("tip replays")
    case roster:
    case ta_roster: return lang("tip roster")
    case ta_menu: return replacebuttonnames(lang("tip ta stage select"))
    case stagesel: return replacebuttonnames(lang("tip stage select"))
}
return ""
