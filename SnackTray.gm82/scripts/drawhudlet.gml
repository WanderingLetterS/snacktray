///drawhudlet(name,string,[color])
//draws string at position of specified hudlet
var p;

p=skindat("hud "+global.gamemode+" "+argument[0])
if (p!=-1) {
    if (argument_count=3) draw_skintext((p mod 48)*8,(p div 48)*8,argument[1],argument[2])
    else draw_skintext((p mod 48)*8,(p div 48)*8,argument[1],$ffffff)
}
