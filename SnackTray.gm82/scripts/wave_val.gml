/// wave_val(from, to, duration, offset)
// Returns a value that will wave back and forth between [from-to] over [duration] seconds

a4 = (argument1 - argument0) * 0.5;
return argument0 + a4 + sin((((current_time * 0.001) + argument2 * argument3) / argument2) * (pi*2)) * a4;
