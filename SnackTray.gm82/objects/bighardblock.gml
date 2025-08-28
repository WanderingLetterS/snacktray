#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with instance_create(x,y,hardblock) {place=0 event_user(1)}//top left
with instance_create(x+16,y,hardblock) {place=1 event_user(1)}//top right
with instance_create(x,y+16,hardblock) {place=2 event_user(1)}//botom left
with instance_create(x+16,y+16,hardblock) {place=3 event_user(1)}//bottom right
