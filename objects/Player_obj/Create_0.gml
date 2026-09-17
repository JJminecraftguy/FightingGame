//useful stats
name = "Player"
//Vertical Movement
startgrav = 0.25
startjumpheight = 8
hopheight = 6
total_jumps = 2
//Horizontal Velocity
startrunspeed = 7.5
walkspeed = 3
airspeed = 4
//Walljumps
startwalljumppower = 10
hopwalljumppower = 5
canwalljump=true
//Dodging
dodgetime = 0.5
startdodgelength = 4.5
dodgeshiftlength = 2.5
dodgeweight = 0.25
rolltime = 0.25
rolllength = 5

//Sprites
IdleAnimation = PlayerIdle_spr
RunAnimation = PlayerRun_spr
JumpAnimation = PlayerJump_spr
FallAnimation = PlayerFall_spr
WallHangAnimation = PlayerWallHang_spr
WallJumpAnimation = PlayerWallJump_spr
DodgeSideAnimation = PlayerDodgeSide_spr
DodgeNeutralAnimation = PlayerDodgeNeutral_spr
RollAnimation = PlayerRoll_spr
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
canrightwall = false
canleftwall = false
dodging = false
updodge= false
downdodge = false
leftdodge = false
rightdodge = false
dodged = false
collisionchecked = false
abletoact = true
windup = false
winddown = false
spritefix=false
