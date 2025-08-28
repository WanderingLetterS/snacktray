maxs=sprite_create_from_screen(0,0,1,1,0,0,0,0)
out="" for (s=0;s<maxs;s+=1) if (sprite_exists(s)) out+=sprite_get_name(s)+","
clipboard_set_text(out)
