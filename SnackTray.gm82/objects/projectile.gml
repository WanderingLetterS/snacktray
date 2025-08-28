#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=used in charm
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=#define projectile
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="step"
event_user(p2)

if (is_spriteswitcher)
spriteswitch(1)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event="draw"
event_user(owner.p2)
if (is_spriteswitcher)
spriteswitch(0)


if global.debug draw_self()
