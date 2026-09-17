//this lowk grabs my collision objects
if (!collisionchecked)
{
	terrain = CollisionList_obj.terrain
	character = CollisionList_obj.character
	hitboxes = CollisionList_obj.characterhitbox
	hurtboxes = CollisionList_obj.characterhurtbox
	playerscollsion = CollisionList_obj.charactercollision
	collisionchecked = true
}
// yo yo yo my y is here
yvelocity += grav
yremainder += yvelocity
ymove = sign(yremainder) * floor(abs(yremainder))
yremainder -= ymove
if (place_meeting(x, y+ymove, terrain))
{
while (!place_meeting(x,y+sign(ymove), terrain))
{
	y+= sign(ymove)
}
yvelocity = 0
}
else
{
y += ymove
}


// xo xo xo get kissed
xremainder += xvelocity
xmove = sign(xremainder) * floor(abs(xremainder))
xremainder -= xmove
if (place_meeting(x+xmove, y, terrain))
{
while (!place_meeting(x+sign(xmove),y, terrain))
{
	x+= sign(xmove)
}
xvelocity = 0
}
else
{
x += xmove
}
//DODGE MOVEMENT!!!
if (updodge)
{
 yvelocity = -dodgelength
}
if (downdodge)
{
yvelocity = dodgelength
}
if (leftdodge)
{
xvelocity = -dodgelength
}
if (rightdodge)
{
xvelocity = dodgelength
}

//CHECKS
//grounded
if (place_meeting(x,y+1, terrain))
{
	grounded = true
	double_jumps = total_jumps
	dodged = false 
	
} else
{
	grounded = false
	runspeed = airspeed
if (!dodging)
{
sprite_index = FallAnimation
}
}
//abletoact
if (!dodging && !winddown && !windup)
{
	abletoact = true
}

//CONTROLS


if (abletoact)
{
abletoact = false

if (keyboard_check(vk_shift))
{
jumpheight = hopheight
walljumppower = hopwalljumppower
runspeed = walkspeed
dodgelength = dodgeshiftlength
} 
else
{
jumpheight = startjumpheight
walljumppower = startwalljumppower
if (grounded)
{
runspeed = startrunspeed
}
dodgelength = startdodgelength
}

//HORIZONTAL MOVEMENT
if (keyboard_check(ord("D"))  && !keyboard_check(ord("A")))
{
xvelocity = runspeed
image_xscale = -image_scale
spritefix=true
if (grounded) 
{
sprite_index = RunAnimation
}
} else if (keyboard_check(ord("A")) && !keyboard_check(ord("D")))
{
xvelocity = -runspeed
image_xscale = image_scale
spritefix=true
if (grounded) 
{
sprite_index = RunAnimation
}
} 
else 
{
xvelocity = 0
if (spritefix && (keyboard_check(ord("A"))) & keyboard_check(ord("D")))
{
image_xscale *= -1
spritefix=false
}
if (grounded)
{
sprite_index = IdleAnimation
}
}



if (!grounded && ((place_meeting(x+1,y, terrain)) or (place_meeting (x-1,y, terrain))))
{
canwalljump = true
sprite_index = WallHangAnimation
if (place_meeting(x+1,y, terrain))
{
	canrightwall = true
} 
else 
{
	canleftwall = true
}
}
else
{
canrightwall = false
canleftwall = false
canwalljump = false
}

//VERTICAL MOVEMENT
if (keyboard_check_pressed(vk_space))
{
	
if (canwalljump)
{
walljump = true
alarm_set(0, game_get_speed(gamespeed_fps)*0.25)
yvelocity = -jumpheight
sprite_index = WallJumpAnimation
if (canrightwall)
{
rightwall = true
} 
else
{
leftwall = true
}
}
//normaljump
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

if (false = true)
{

//DODGING 
if (keyboard_check_pressed(ord("U"))&&!dodged)
{
image_alpha = 0.5
xvelocity *= 0.10
yvelocity *= 0.10
grav *= dodgeweight
dodging = true 
if(!grounded)
{
alarm_set(1, game_get_speed(gamespeed_fps)*dodgetime)
sprite_index = DodgeNeutralAnimation
if (keyboard_check(ord("W")))
{
updodge = true
}
if (keyboard_check(ord("S")))
{
downdodge = true
}
if (keyboard_check(ord("A")))
{
leftdodge = true
sprite_index = DodgeSideAnimation
image_xscale = image_scale
}
if (keyboard_check(ord("D")))
{
rightdodge = true
sprite_index = DodgeSideAnimation
image_xscale = -image_scale
}
}
else
{
	dodgelength = rolllength
alarm_set(1, game_get_speed(gamespeed_fps)*rolltime)
sprite_index = RollAnimation
if (keyboard_check(ord("A")))
{
	leftdodge = true
image_xscale = image_scale
}
if (keyboard_check(ord("D")))
{
rightdodge = true
image_xscale = -image_scale 
}
}
if (leftdodge and rightdodge)
{
leftdodge = false
rightdodge = false
}
if (updodge and downdodge)
{
downdodge = false
updodge = false
}
}

}

}