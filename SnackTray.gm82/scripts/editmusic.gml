///editmusic()
//like optmusic, but for lemon
var fn;

sound("systemselect")

if (settings("lemonmusic")!="") {
    settings("lemonmusic","")
    menumusic()
} else {
    fn=get_open_filename("Digital Audio Files|*.ogg;*.wav;*.mp3;*.mp2;*.aif;*.aiff;*.flac;*.asf;*.wma|Sequenced Audio Files|*.mod;*.xm;*.it;*.s3m;*.mid","")
    if (file_exists(fn)) {
        FMODAllStop()
        if (replaceogg("editor",fn)) {
            settings("lemonmusic",fn)
            menumusic()
        }
    }
}
