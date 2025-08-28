///settings_resetbinds(skipquestion)
//resets keybinds in bind config menu (lol)

question=argument[0]
if !question {
    question=show_question("Are you sure you want to reset these bindings?")
    sound("systemselect")
}
if question {
    if (mode="key") {
        var grab,tpos;
        grab=global.defaultkeyboard[keyb+1]
        for (i=0;i<12;i+=1) {
            tpos=string_pos("|",grab)
            if (!tpos) {
                global.key[i,keyb]=unreal(grab)
            } else {
                global.key[i,keyb]=unreal(string_copy(grab,0,tpos-1))
                grab=string_delete(grab,1,tpos)
            }
        }
    }
    else {
        var grab,tpos;
        grab=joy_default(joy)
        for (i=0;i<12;i+=1) {
            tpos=string_pos("|",grab)
            if (!tpos) {
                joymap[i]=grab
            } else {
                joymap[i]=string_copy(grab,0,tpos-1)
                grab=string_delete(grab,1,tpos)
            }
        }
    }
    resetbinds=1
}
