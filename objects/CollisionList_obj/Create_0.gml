character = [TrainingDummy_obj, Player_obj]
terrain = [ground_obj]
charactercollision = []
characterhurtbox = []
characterhitbox = []

var arraynumber = array_length(character)
var playercollisionlist = 0
while (playercollisionlist < arraynumber)
{
var name = character[playercollisionlist]
var namepos = string_length(name) - 3
var collisionname = string_insert("collision", name, namepos)
var hurtboxname = string_insert("hurtbox", name, namepos)
var hitboxname = string_insert("hitbox", name, namepos)
array_push(charactercollision,collisionname)
array_push(characterhurtbox,hurtboxname)
array_push(characterhitbox,hitboxname)
playercollisionlist += 1
}
