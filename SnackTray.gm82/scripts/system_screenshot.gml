///system_screenshot(screen)
//takes a screenshot to file
directory_create(global.workdir+"shots")
fn=global.workdir+"shots\"+current_date_filename()
if (file_exists(fn+".png")) {
    i=2
    while (file_exists(fn+" ("+string(i)+").png")) i+=1
    fn+=" ("+string(i)+")"
}
if (argument[0]) screen_save(fn+".png")
else surface_save(appsurf,fn+".png")

stats("screenshots taken",stats("screenshots taken")+1)
