///notifies the user that the game crashed and moves the crash log to a reusable location
if (file_exists("game_errors.log")) {
    ping(lang("error crash"))
    crashloghandler()
}
