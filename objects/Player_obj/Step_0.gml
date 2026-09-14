if (!collisionchecked)
{
	collision = array_concat(CollisionList_obj.character,CollisionList_obj.terrain)
	collisionchecked = true
}



yvelocity += grav
if (place_meeting(x, y+yvelocity, collision))
{
while (!place_meeting(x,y+sign(yvelocity), collision))
{
	y+= sign(yvelocity)
}
yvelocity = 0
if (place_meeting(x,y+1, collision))
{
	grounded = true
}
}
else
{
y += yvelocity
grounded = false
}


if (place_meeting(x+xvelocity, y, collision))
{
while (!place_meeting(x+sign(xvelocity),y, collision))
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
dodged = false 
} else
{
runspeed = airspeed
if (!dodging)
{
sprite_index = InAirAnimation
}
}
//cONTROLS

if (keyboard_check_released(vk_shift))
{
jumpheight = startjumpheight
walljumppower = startwalljumppower
runspeed = startrunspeed
dodgelength = startdodgelength
}
if (!dodging)
{
//HORIZONTAL MOVEMENT

if (keyboard_check(ord("D")))
{
xvelocity = runspeed
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
xvelocity = -runspeed
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
//VERTIcAL MOVEMENT
if (keyboard_check(vk_shift))
{
jumpheight = hopheight
walljumppower = hopwalljumppower
runspeed = walkspeed
dodgelength = dodgeshiftlength
}
if (keyboard_check_pressed(vk_space))
{
if (canwalljump)
{
if ((place_meeting(x+1,y, collision)&& !grounded)) 
{
rightwall = true
walljump = true
alarm_set(0, game_get_speed(gamespeed_fps)*0.25);  
yvelocity = -jumpheight
}
if ((place_meeting(x-1,y, collision)&& !grounded)) 
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


//DODGING 
if (keyboard_check_pressed(ord("U"))&&!dodged)
{
dodged = true
dodging = true
xvelocity = 0
yvelocity = 0
grav *= dodgeweight
if (!grounded)
{
alarm_set(1, game_get_speed(gamespeed_fps)*dodgetime)
sprite_index = DodgeAnimation
if(keyboard_check(ord("W")))
{
updodge= true
}
if(keyboard_check(ord("S")))
{
downdodge= true
}
if(keyboard_check(ord("A")))
{
leftdodge= true
image_xscale = -image_scale
}
if(keyboard_check(ord("D")))
{
rightdodge= true
image_xscale = image_scale
}
}
if (grounded)
{
alarm_set(1, game_get_speed(gamespeed_fps)*rolltime)
sprite_index= RollAnimation
if(keyboard_check(ord("A")))
{
leftdodge= true
image_xscale = -image_scale
}
if(keyboard_check(ord("D")))
{
rightdodge= true
image_xscale = image_scale
}
}
}
if (leftdodge == true)
{
xvelocity -= dodgelength
}
if (rightdodge == true)
{
xvelocity += dodgelength
}
if (updodge == true)
{
yvelocity -= dodgelength
}
if (downdodge = true)
{
yvelocity += dodgelength
}
}