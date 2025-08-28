///startinview()
//same as inview() but for start position

var tmp,ret;

tmp=x
x=xstart
ret=inview()
x=tmp

return ret
