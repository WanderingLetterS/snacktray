var kek;
directory_create(working_directory+"\SnackBowl_crashes")
if (global.debug) kek=" - debug" else kek=""
file_rename("game_errors.log",working_directory+"\SnackBowl_crashes\"+current_date_filename()+kek+".txt")
