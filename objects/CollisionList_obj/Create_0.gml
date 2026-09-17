character = [TrainingDummy_obj, Player_obj]
terrain = [ground_obj]
charactercollision = []
characterhurtbox = []
characterhitbox = []

var arraynumber = array_length(character)
var playercollisionlist = 0
while (playercollisionlist < arraynumber)
{
var name = object_get_name(character[playercollisionlist])
var namepos = string_length(name) - 3
var collisionname = string_insert("Collision", name, namepos)
var hurtboxname = string_insert("Hurtbox", name, namepos)
var hitboxname = string_insert("Hitbox", name, namepos)
array_push(charactercollision,collisionname)
array_push(characterhurtbox,hurtboxname)
array_push(characterhitbox,hitboxname)
playercollisionlist += 1
}

show_debug_message("charactercollision: " + string(charactercollision))
show_debug_message("characterhurtbox: " + string(characterhurtbox))
show_debug_message("characterhitbox: " + string(characterhitbox))