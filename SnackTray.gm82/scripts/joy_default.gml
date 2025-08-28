///joy_default(joy id)
//returns default controller binds lol
joyname=joy_get(argument[0],3,0)
if (string_pos("xbox",string_lower(joyname)))
    profile="axis 1 -|axis 1 +|axis 0 -|axis 0 +|button 0|button 2|button 1|button 7|"
else if (string_pos("wireless controller",string_lower(joyname)))
    profile="hat 0|hat 180|hat 270|hat 90|button 1|button 0|button 2|button 9|"
else
    profile="axis 1 -|axis 1 +|axis 0 -|axis 0 +|button 1|button 0|button 2|button 3|"
return profile;
