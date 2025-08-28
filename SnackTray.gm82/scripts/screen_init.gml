//we create the object at runtime to make sure that its endstep
//will always execute last, right before the draw events fire
//this prevents issues with objects that surface prep on endstep
if global.screen_manager!=0 exit
o=object_add()
object_event_add(o,ev_step,ev_step_end,"screen_prepare()")
object_set_persistent(o,1)
instance_create(0,0,o)

global.screen_manager=o
