if (!characterchecked)
{
	character = CollisionList_obj.character
	characterchecked = true
}

var charactersx = []
var charactersy = []
var loop = 0
while (loop < array_length(character))
{
var loopa = character[loop]
loop += 1
if (instance_exists(loopa))
{
if (point_distance(2048, 1024, loopa.x, loopa.y) < 3072)
{
array_push(charactersx, loopa.x)
array_push(charactersy, loopa.y)
}
}
}

var meansumx = 0
var meansumy = 0
var meandivide = array_length(charactersx)
var meanloop = 0
while (meanloop < meandivide)
{
var meanloopa = charactersx[meanloop]
var meanloopb = charactersy[meanloop]
meanloop += 1
meansumx += meanloopa
meansumy += meanloopb
}
if (meandivide > 0)
{
xmiddle = meansumx / meandivide
ymiddle = meansumy / meandivide
}

var maxdistx = 0
var maxdisty = 0
var distloop = 0
while (distloop < meandivide)
{
var dx = charactersx[distloop] - xmiddle
var dy = charactersy[distloop] - ymiddle
maxdistx = max(maxdistx, abs(dx))
maxdisty = max(maxdisty, abs(dy))
distloop += 1
}

var base_w = 1152
var base_h = 768
var ratio = base_w / base_h
var needed_w = maxdistx * 2 + 600
var needed_h = maxdisty * 2 + 600

var h_from_w = needed_w / ratio

if (h_from_w >= needed_h)
{
new_w = needed_w
new_h = h_from_w
}
else
{
new_h = needed_h
new_w = new_h * ratio
}

new_w = max(new_w, base_w)
new_h = new_w / ratio

camera_set_view_size(camera, new_w, new_h)
camera_set_view_pos(camera, lerp(camera_get_view_x(camera), xmiddle - new_w / 2, 0.1), lerp(camera_get_view_y(camera), ymiddle - new_h / 2, 0.1))   