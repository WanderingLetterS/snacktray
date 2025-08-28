//runner version check
//returns false on older than 8.1.141 or lite edition

if (!gamemaker_pro) return 0

error_occurred=0

execute_string("clamp(0,0,0)")

return !error_occurred
