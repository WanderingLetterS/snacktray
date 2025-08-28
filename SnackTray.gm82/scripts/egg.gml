//easter egg randomizer
var chance;

chance=0
if (argument_count) chance=argument[0]

if ((global.easter || (irandom(100)<=chance)) && !settings("killjoy")) {
    stats("easter eggs seen",stats("easter eggs seen")+1)
    return 1
}
return 0
