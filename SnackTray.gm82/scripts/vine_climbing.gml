//vine_climbing() the common script used by all characters to climb on vines
if (up && !down && !onvine) {
    cx=floor(x/16)*16+8
    cy=floor(y/16)*16+8
    onvine=position_meeting(cx,cy,vine)
    if (onvine) fall=69 //nice
}
if (fall=69) {
    gobackx=x
    gobacky=y
    cx=floor(x/16)*16+8
    cy=floor(y/16)*16+8


    vinecc=!!position_meeting(cx,cy,vine)
    vinecl=!!position_meeting(cx-16,cy,vine)
    vinecr=!!position_meeting(cx+16,cy,vine)
    vinecu=!!position_meeting(cx,cy-16,vine)
    vinecd=!!position_meeting(cx,cy+16,vine)
    hsp=0
    vsp=0

    movedx=0
    movedy=0

    nx=x+h
    if nx!=x movedx=1
    ny=y+down-up
    if ny!=y movedy=1

    ncx=floor(nx/16)*16+8
    ncy=floor(ny/16)*16+8
    nvinecx=!!position_meeting(ncx,cy,vine)
    nvinecy=!!position_meeting(cx,ncy,vine)

    if !nvinecx {
    if !vinecl nx+=1
    if !vinecr nx-=1
    }
    if !nvinecy {
    if !vinecu ny+=1
    if !vinecd ny-=1
    }

    ncx=floor(nx/16)*16+8
    ncy=floor(ny/16)*16+8
     nvinecxy=!!position_meeting(ncx,ncy,vine)
    if nvinecxy{
    x=nx
    y=ny}
    h=0
    if (onvine.movingnation) {
        x+=onvine.hsp
        y+=onvine.vsp
    }
    if collision(0,0){
        x=gobackx
        y=gobacky
    }

    if (hurt) {fall=1 onvine = 0}
}
