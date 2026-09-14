//useful stats
name = "Player"
//Vertical Movement
startgrav = 0.25
startjumpheight = 8
hopheight = 5
total_jumps = 2
//Horizontal Velocity
startrunspeed = 8
walkspeed = 3
airspeed = 4
//Walljumps
startwalljumppower = 10
hopwalljumppower = 5
canwalljump=true
//Dodging
dodgetime = 1
startdodgelength = 5
dodgeshiftlength = 2.5
dodgeweight = 0.25
rolltime = 0.5

//Sprites
IdleAnimation = Player_spr
RunAnimation = PlayerRun_spr
JumpAnimation = PlayerJump_spr
InAirAnimation = PlayerJump_spr
DodgeAnimation = PlayerInvincibility_spr
RollAnimation = PlayerInvincibility_spr
//values
yvelocity = 0
xvelocity = 0
xremainder = 0
yremainder = 0
runspeed=startrunspeed
jumpheight = startjumpheight
walljumppower = startwalljumppower
dodgelength = startdodgelength
grav = startgrav
double_jumps = total_jumps
image_scale = image_xscale
//booleans
grounded=false
walljump=false
rightwall=false
leftwall=false
inair=false
dodging = false
updodge= false
downdodge = false
leftdodge = false
rightdodge = false
dodged = false
collisionchecked = false
