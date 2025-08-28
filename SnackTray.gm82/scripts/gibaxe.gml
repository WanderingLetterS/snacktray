if (other.name="kid") with (other) hurtplayer("item")
else event_user(1)
if other.name="super" with(other) { if abs(instance_nearest(x,y,retainer).x-x)<1000 stopsuper()}
