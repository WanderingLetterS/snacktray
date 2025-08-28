///specialeload([filename])
var u,v,fn,str,nx,ny,mx,my,ox,oy,img;

with (specialectrl) {
    if (argument_count) fn=argument[0]
    else fn=get_open_filename("Text files|*.txt","")

    if (file_exists(fn)) {
        specialenew(0)
        workingfn=fn
        replacespecial(9999,fn)
        str=skinstr("specialstr9999")
        time=skindat("specialtime9999")
        check[0]=skindat("specialchk19999")
        check[1]=skindat("specialchk29999")
        check[2]=skindat("specialchk39999")

        v=0
        p=string_pos("|",str)
        while (p) {
            line=string_copy(str,1,p-1)
            l=string_length(line)
            str=string_delete(str,1,p)
            for (u=1;u<=l;u+=1) {
                img=string_pos(string_char_at(line,u),global.specialestr)-1
                if (img!=-1) with (instance_create(u*32,v*32,specialeobj)) image_index=img
            }
            v+=1
            p=string_pos("|",str)
        }
        nx=2016
        ny=2016
        mx=0
        my=0
        with (specialeobj) {
            nx=min(nx,x)
            mx=max(mx,x)
            ny=min(ny,y)
            my=max(my,y)
        }
        ox=31*32-round((nx+mx)/64)*32
        oy=31*32-round((ny+my)/64)*32

        with (specialeobj) {
            x+=ox
            y+=oy
        }
        specialehud.str="Loaded file "+fn
        specialehud.alpha=8
    }
}
