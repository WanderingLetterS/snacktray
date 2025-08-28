///player_climbstep(thesteptoclimb,calc)
//climb steps
if jump if (bbox_bottom-argument[0].bbox_top<9 && (place_meeting(x,y,slopy)) && !collision(0,-8) && argument[0].nslop=0) {
    y-=1
    return 1
}

//Climb masks
calc=argument[1]

if argument[0].nslop=1 && !argument[0].u  &&(
    !(jump && vsp<0) && (bbox_bottom<=argument[0].bbox_bottom) ||
    (argument[0].s=0 &&
        (
            (argument[0].l=0 && (bbox_left-2-ceil(abs(calc)))<=argument[0].bbox_right)||
            (argument[0].l=1 && (bbox_right+2+ceil(abs(calc)))>=argument[0].bbox_left)
        ) && ((bbox_bottom-2-ceil(abs(calc)))<=argument[0].bbox_bottom)
    )
)
{ y-=max(2,round(abs(calc)))  if (jump && vsp>=-0.6) com_landing()  return 1}


return 0
