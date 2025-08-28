///addmovelist(str)
//seperates each page
var str,spec,section;
str=argument[1]
if (string_pos("<",str) && string_pos(">",str)) {
    section=string_replace(string_replace(str,"<",""),">","")
    spec=-1
    switch (section) {
        case "page": spec=0 break
        case "small": spec=1 break
        case "big": spec=2 break
        case "fire": spec=3 break
        case "feather": spec=4 break
        case "extra": spec=5 break
        case "mini": spec=6 break //hope this doesnt mess up the thing i did several months ago! -moster
        case "custom": {if custompage<7 custompage=7 spec=custompage custompage+=1 break} //your honor my client pleads 2 custom powerups -moster
    }
    if (spec!=-1) {
        movesetpage+=1
        if (spec) global.pagespec[argument[0],spec-1]=movesetpage
        exit
    }
}
//my solutions are not elegant
if (is_real(global.movelist[argument[0],movesetpage])) global.movelist[argument[0],movesetpage]=""
global.movelist[argument[0],movesetpage]+=replacebuttonnames(str)+"#"
