
yvelocity += grav
if (place_meeting(x, y+yvelocity, ground_obj))
{
while (!place_meeting(x,y+sign(yvelocity), ground_obj))
{
	y+= sign(yvelocity)
}
yvelocity = 0
if (place_meeting(x,y+1, ground_obj))
{
	grounded = true
}
}
else
{
y += yvelocity
grounded = false
}


if (place_meeting(x+xvelocity, y, ground_obj))
{
while (!place_meeting(x+sign(xvelocity),y, ground_obj))
{
	x+= sign(xvelocity)
}
xvelocity = 0

}
else
{
x += xvelocity
}

if (grounded)
{
if (runspeed == airspeed)
{
runspeed = startrunspeed
}
double_jumps = total_jumps
} else
{
runspeed = airspeed
sprite_index = InAirAnimation
}
//CONTROLS

//HORIZONTAL MOVEMENT
xvelocity = 0
if (keyboard_check(ord("D")))
{
xvelocity += runspeed
if (grounded) 
{
sprite_index = RunAnimation
}
if (!keyboard_check(ord("A")))
{
image_xscale=-image_scale
}
}

if (keyboard_check(ord("A")))
{
xvelocity -= runspeed
if (grounded) 
{
sprite_index = RunAnimation
}
if (!keyboard_check(ord("D")))
{
image_xscale=image_scale
}
}
if (keyboard_check(ord("A"))&&keyboard_check(ord("D")))
{
xvelocity = 0
if (grounded) 
{
sprite_index = IdleAnimation
}
}
if (!keyboard_check(ord("A"))&&!keyboard_check(ord("D")))
{
xvelocity = 0
if (grounded) 
{
sprite_index = IdleAnimation
}
}
//VERTICAL MOVEMENT
if (keyboard_check(vk_shift))
{
jumpheight = hopheight
walljumppower = hopwalljumppower
runspeed = walkspeed
}
if (keyboard_check_released(vk_shift))
{
jumpheight = startjumpheight
walljumppower = startwalljumppower
runspeed = startrunspeed
}
if (keyboard_check_pressed(vk_space))
{
if (canwalljump)
{
if ((place_meeting(x+1,y, ground_obj)&& !grounded)) 
{
rightwall = true
walljump = true
alarm_set(0, game_get_speed(gamespeed_fps)*0.25);  
yvelocity = -jumpheight
}
if ((place_meeting(x-1,y, ground_obj)&& !grounded)) 
{
leftwall= true
walljump = true
alarm_set(0, game_get_speed(gamespeed_fps)*0.25);      
yvelocity = -jumpheight
}
}
if (double_jumps >= 1 && !walljump)
{
sprite_index = JumpAnimation
yvelocity = -jumpheight
double_jumps -= 1
}
}
if (leftwall)
{
xvelocity +=walljumppower
image_xscale=-image_scale
}
if (rightwall)
{
xvelocity -= walljumppower
image_xscale=image_scale
}